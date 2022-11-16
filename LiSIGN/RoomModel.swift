//
//  Room.swift
//  LiSIGN
//

import Foundation
import SwiftUI
import ModelIO

class Room {
    private var title: String
    private var image: Image
    private var type: String
    private var roomObject: MDLAsset // MDLAsset is the type that LiDAR gives back for the 3D room scan

    init(title: String, image: Image, type: String, roomObject: MDLAsset) {
        self.title = title
        self.image = image
        self.type = type
        self.roomObject = roomObject
    }

    func getTitle() -> String{
        return self.title
    }

    func setTitle(title: String) {
        self.title = title
    }

    func getImage() -> Image{
        return self.image
    }

    func setImage(image: Image) {
        self.image = image
    }

    func getType() -> String{
        return self.type
    }

    func setType(type: String) {
        self.type = type
    }
    
    func getRoomObject() -> MDLAsset {
        return self.roomObject
    }
    
    func setRoomObject(roomObject: MDLAsset) {
        self.roomObject = roomObject
    }
}

//struct Room: Decodable {
//    var title: String
//    var image: Image
//    var type: String
//    var roomObject: MDLAsset
//}

