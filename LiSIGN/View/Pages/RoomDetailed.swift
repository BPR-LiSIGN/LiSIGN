//
//  RoomDetailed.swift
//  LiSIGN
//

import SwiftUI
import SceneKit

struct RoomDetailed: View {
    @State var index = 0
    var room: Room
    
    var body: some View {
        VStack{
            SceneView(scene: SCNScene(named: "scaned-my room-full.obj"), options: [.autoenablesDefaultLighting, .allowsCameraControl])
            
            Spacer()
            
            Text(room.title)
            Text(room.description)
        }
        .frame(width: 400, height: 400)
    }
}

struct RoomDetailed_Previews: PreviewProvider {
    static var previews: some View {
        let r = Room(title: "Kitchen", description: "This is my nice kitchen")
        RoomDetailed(room: r)
    }
}
