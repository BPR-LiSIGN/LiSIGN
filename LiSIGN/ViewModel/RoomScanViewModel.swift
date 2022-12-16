/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Main view controller for the AR experience.
*/

/**
# REFERENCE
 The Swift Class is taken from the sample code from the official documentation of Apple (https://developer.apple.com/documentation/arkit/content_anchors/visualizing_and_interacting_with_a_reconstructed_scene)

 The proper reference is done in the Sources of information inside the Project Report.
 */

import Foundation
import RealityKit
import ARKit
import ModelIO
import MetalKit
import QuickLook


class RoomScanViewModel: UIViewController, ARSessionDelegate {
    
    @IBOutlet var arView: ARView!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var planeDetectionButton: UIButton!
    @IBOutlet weak var saveButton: RoundedButton!
    
    let coachingOverlay = ARCoachingOverlayView()
    
    
    /// - Tag: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arView.session.delegate = self
        
        setupCoachingOverlay()

        arView.environment.sceneUnderstanding.options = []
        
        // Turn on occlusion from the scene reconstruction's mesh.
        arView.environment.sceneUnderstanding.options.insert(.occlusion)
        
        // Turn on physics for the scene reconstruction's mesh.
        arView.environment.sceneUnderstanding.options.insert(.physics)

        // Display a debug visualization of the mesh.
        arView.debugOptions.insert(.showSceneUnderstanding)
        
        // For performance, disable render options that are not required for this app.
        arView.renderOptions = [.disablePersonOcclusion, .disableDepthOfField, .disableMotionBlur]
        
        // Manually configure what kind of AR session to run
        arView.automaticallyConfigureSession = false
        let configuration = ARWorldTrackingConfiguration()
        configuration.sceneReconstruction = .mesh

        configuration.environmentTexturing = .automatic
        arView.session.run(configuration)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Prevent the screen from being dimmed to avoid interrupting the AR experience.
        UIApplication.shared.isIdleTimerDisabled = true
    }
    
    
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        if let configuration = arView.session.configuration {
            arView.session.run(configuration, options: .resetSceneReconstruction)
        }
    }
    
    
    
    /// - Tag: TogglePlaneDetection
    @IBAction func togglePlaneDetectionButtonPressed(_ button: UIButton) {
        guard let configuration = arView.session.configuration as? ARWorldTrackingConfiguration else {
            return
        }
        if configuration.planeDetection == [] {
            configuration.planeDetection = [.horizontal, .vertical]
            button.setTitle("Stop Plane Detection", for: [])
        } else {
            configuration.planeDetection = []
            button.setTitle("Start Plane Detection", for: [])
        }
        arView.session.run(configuration)
    }
    
    
    /// - Tag: Export Mesh
    /// ***********************************************************************************************
    /// Exporting the LIDAR scan as OBJ file
    /// - Author: Stefan Pfeifer
    /*  # REFERENCE
        The Swift Class is taken from the sample code from the Medium post (https://medium.com/zeitraumgruppe/what-arkit-3-5-and-the-new-ipad-pro-bring-to-the-table-d4bf25e5dd87)
     which is based on the official sample code from Apple ((https://developer.apple.com/documentation/arkit/content_anchors/visualizing_and_interacting_with_a_reconstructed_scene)
)
        The proper reference is done in the Sources of information inside the Project Report.
     */
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        /**
                 At the start of the save method, we need to get the current ARFrame, which gives access to all ARAnchors currently placed in the scene.
                 Of those, we only need anchors with meshed of the scene reconstruction in them. So we filter them to get only the ones which also are ARMeshAnchor objects.
        */
        guard let frame = arView.session.currentFrame else {
            fatalError("Couldn't get the current ARFrame")
        }
        
        // Fetch the default MTLDevice to initialize a MetalKit buffer allocator with
        guard let device = MTLCreateSystemDefaultDevice() else {
            fatalError("Failed to get the system's default Metal device!")
        }
        
        // Using the Model I/O framework to export the scan, so we're initialising an MDLAsset object,
        // which we can export to a file later, with a buffer allocator
        let allocator = MTKMeshBufferAllocator(device: device)
        let asset = MDLAsset(bufferAllocator: allocator)
        
        // Fetch all ARMeshAncors
        let meshAnchors = frame.anchors.compactMap({ $0 as? ARMeshAnchor })
        
        // Convert the geometry of each ARMeshAnchor into a MDLMesh and add it to the MDLAsset
        for meshAncor in meshAnchors {
            /**
             We need to assemble a MDLAsset object (using Model I/O), which in the end will contain the complete scene and can be exported to a file.
             To create one we need to initialise it with an instance of an MDLMeshBufferAllocator implementation to throw memory around.
             As such, we choose MTKMeshBufferAllocator, because RealityKit uses Metal as a Renderer. That in turn needs to be initialised with a MTLDevice instance, which is basically a reference to the graphics processor of the device
            */
            /**
             All of the next steps, have to be done for every ARMeshAnchor we gathered earlier. We will need to convert the position of every vertex in its meash from local space to world space and write the result back into it's position in the vertex buffer.
            */
            // Some short handles, otherwise stuff will get pretty long in a few lines
            let geometry = meshAncor.geometry
            let vertices = geometry.vertices
            let faces = geometry.faces
            let verticesPointer = vertices.buffer.contents()
            let facesPointer = faces.buffer.contents()
            
            // Converting each vertex of the geometry from the local space of their ARMeshAnchor to world space
            for vertexIndex in 0..<vertices.count {
                
                // Extracting the current vertex with an extension method provided by Apple in Extensions.swift
                let vertex = geometry.vertex(at: UInt32(vertexIndex))
                
                // Building a transform matrix with only the vertex position
                // and apply the mesh anchors transform to convert into world space
                var vertexLocalTransform = matrix_identity_float4x4
                vertexLocalTransform.columns.3 = SIMD4<Float>(x: vertex.0, y: vertex.1, z: vertex.2, w: 1)
                let vertexWorldPosition = (meshAncor.transform * vertexLocalTransform).position
                
                // Writing the world space vertex back into it's position in the vertex buffer
                let vertexOffset = vertices.offset + vertices.stride * vertexIndex
                let componentStride = vertices.stride / 3
                verticesPointer.storeBytes(of: vertexWorldPosition.x, toByteOffset: vertexOffset, as: Float.self)
                verticesPointer.storeBytes(of: vertexWorldPosition.y, toByteOffset: vertexOffset + componentStride, as: Float.self)
                verticesPointer.storeBytes(of: vertexWorldPosition.z, toByteOffset: vertexOffset + (2 * componentStride), as: Float.self)
                /**
                 That is because the position of the vertices is stored relatively to the transform of its anchor and OBJ files have no concept of a scene hierarchy. The export method of the MDLAsset doesn't convert it for us, so we have to do it manually. Otherwise every mesh anchors vertex positions would start from the world origin after the export and we would end up with something like this https://miro.medium.com/max/4800/1*Q30YDCy7LjTiJn5kEx7kZw.png
                 */

            }
            
            /**
             Now everything is prepared to actually convert our scene geometry into a format which can be exported. We start by using the mesh buffer allocator to create MDLMeshBuffer out of the vertex and index MTLBuffers which can then be used to feed the mesh creation process. Next we initialise a MDLSubMesh with the index buffer and describe the type of faces we have, in our case triangles. So the sub mesh knows, every 3 indices in the index buffer describe one face. We also need to create MDLVertexDescriptor which we feed information about the memory layout of the vertex buffer. With all of that in place, we finally can build the Model I/O representation of our mesh, a MDLMesh. We add it to the MDLAsset and repeat the whole process for the other ARMeshAnchors.
             */
            
            // Initializing MDLMeshBuffers with the content of the vertex and face MTLBuffers
            let byteCountVertices = vertices.count * vertices.stride
            let byteCountFaces = faces.count * faces.indexCountPerPrimitive * faces.bytesPerIndex
            let vertexBuffer = allocator.newBuffer(with: Data(bytesNoCopy: verticesPointer, count: byteCountVertices, deallocator: .none), type: .vertex)
            let indexBuffer = allocator.newBuffer(with: Data(bytesNoCopy: facesPointer, count: byteCountFaces, deallocator: .none), type: .index)
            
            // Creating a MDLSubMesh with the index buffer and a generic material
            let indexCount = faces.count * faces.indexCountPerPrimitive
            let material = MDLMaterial(name: "mat1", scatteringFunction: MDLPhysicallyPlausibleScatteringFunction())
            let submesh = MDLSubmesh(indexBuffer: indexBuffer, indexCount: indexCount, indexType: .uInt32, geometryType: .triangles, material: material)
            
            // Creating a MDLVertexDescriptor to describe the memory layout of the mesh
            let vertexFormat = MTKModelIOVertexFormatFromMetal(vertices.format)
            let vertexDescriptor = MDLVertexDescriptor()
            vertexDescriptor.attributes[0] = MDLVertexAttribute(name: MDLVertexAttributePosition, format: vertexFormat, offset: 0, bufferIndex: 0)
            vertexDescriptor.layouts[0] = MDLVertexBufferLayout(stride: meshAncor.geometry.vertices.stride)
            
            // Finally creating the MDLMesh and adding it to the MDLAsset
            let mesh = MDLMesh(vertexBuffer: vertexBuffer, vertexCount: meshAncor.geometry.vertices.count, descriptor: vertexDescriptor, submeshes: [submesh])
            asset.add(mesh)
        }
        
        /**
         Finally, when the MDLAsset is fed with all meshes of the scene geometry, we can export it to an OBJ file and share it via UIActivityViewController(probably the controller is going to be changed)
         */
        
        // Setting the path to export the OBJ file to
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let urlOBJ = documentsPath.appendingPathComponent("scan.obj")

        // Exporting the OBJ file
        if MDLAsset.canExportFileExtension("obj") {
            print("------number of mesh ancors: \(meshAnchors.count)")
            do {
                try asset.export(to: urlOBJ)
                
                // Sharing the OBJ file
                let activityController = UIActivityViewController(activityItems: [urlOBJ], applicationActivities: nil)
                activityController.popoverPresentationController?.sourceView = sender
                self.present(activityController, animated: true, completion: nil)
            } catch let error {
                fatalError(error.localizedDescription)
            }
        } else {
            fatalError("Can't export OBJ")
        }
    } // End of saveButtonPressed function
    /// ***********************************************************************************************

    
    func session(_ session: ARSession, didFailWithError error: Error) {
        guard error is ARError else { return }
        let errorWithInfo = error as NSError
        let messages = [
            errorWithInfo.localizedDescription,
            errorWithInfo.localizedFailureReason,
            errorWithInfo.localizedRecoverySuggestion
        ]
        let errorMessage = messages.compactMap({ $0 }).joined(separator: "\n")
        DispatchQueue.main.async {
            // Present an alert informing about the error that has occurred.
            let alertController = UIAlertController(title: "The AR session failed.", message: errorMessage, preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart Session", style: .default) { _ in
                alertController.dismiss(animated: true, completion: nil)
                self.resetButtonPressed(self)
            }
            alertController.addAction(restartAction)
            self.present(alertController, animated: true, completion: nil)
        }
    } // End of session function
    
}
