//
//  Room.swift
//  LiSIGN
//

import Foundation
import SwiftUI
import ModelIO

public class Room {
//    private var title: String
//    private var image: Image
//    private var type: String
//    private var roomObject: MDLAsset // MDLAsset is the type that LiDAR gives back for the 3D room scan
//
//    init(title: String, image: Image, type: String, roomObject: MDLAsset) {
//        self.title = title
//        self.image = image
//        self.type = type
//        self.roomObject = roomObject
//    }
//
//    func getTitle() -> String{
//        return self.title
//    }
//
//    func setTitle(title: String) {
//        self.title = title
//    }
//
//    func getImage() -> Image{
//        return self.image
//    }
//
//    func setImage(image: Image) {
//        self.image = image
//    }
//
//    func getType() -> String{
//        return self.type
//    }
//
//    func setType(type: String) {
//        self.type = type
//    }
//
//    func getRoomObject() -> MDLAsset {
//        return self.roomObject
//    }
//
//    func setRoomObject(roomObject: MDLAsset) {
//        self.roomObject = roomObject
//    }
    private var _id: Int = 0    // Maybe we don't need an id at all
    private var _title: String = ""
    private var _image: String = ""
    private var _type: String = ""
    private var _roomObject: MDLAsset // MDLAsset is the type that LiDAR gives back for the 3D room scan
    
    public init(roomObject: MDLAsset) {
        self._roomObject = roomObject
        // For now, the rest of the properties are hardcoded
        self.title = "Scan 1"
        self.type = "Room"
        // TODO: missing id property
    }
    
    public var title: String {
        get {
            return self._title;
        }
        set {
            self._title = newValue
        }
    }
    
    public var image: String {
        get {
            return self._image;
        }
        set {
            self._image = newValue
        }
    }
    
    public var type: String {
        get {
            return self._type;
        }
        set {
            self._type = newValue
        }
    }
    
    public var roomObject: String {
        get {
            return self._roomObject;
        }
        set {
            self._roomObject = newValue
        }
    }
}

//struct Room: Decodable {
//    var title: String
//    var image: Image
//    var type: String
//    var roomObject: MDLAsset
//}

