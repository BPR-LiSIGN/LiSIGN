//
//  RoomDetailed.swift
//  LiSIGN
//

import SwiftUI
import SceneKit

struct RoomDetailed: View {
    @State var index = 0
    
    var body: some View {
        VStack{
            SceneView(scene: SCNScene(named: "fender_stratocaster.usdz"), options: [.autoenablesDefaultLighting, .allowsCameraControl])
            
            Spacer()
            
            Text("Room name")
            Text("Description")
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
        }
        .frame(width: 400, height: 400)
    }
}

struct RoomDetailed_Previews: PreviewProvider {
    static var previews: some View {
        RoomDetailed()
    }
}
