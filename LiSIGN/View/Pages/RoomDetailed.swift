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
            Text("Room Detailed page")
            SceneView(scene: SCNScene(named: "fender_stratocaster.usdz"), options: [.autoenablesDefaultLighting, .allowsCameraControl])
        }
        .frame(width: 400, height: 400)
    }
}

struct RoomDetailed_Previews: PreviewProvider {
    static var previews: some View {
        RoomDetailed()
    }
}
