//
//  Room.swift
//  LiSIGN
//

import Foundation
import SwiftUI
import ModelIO

public class Room {
    private var _id: UUID = UUID()    // Maybe we don't need an id at all
    private var _title: String = ""
    private var _image: String = ""
    private var _type: String = ""
    private var _roomObject: MDLAsset // MDLAsset is the type that LiDAR gives back for the 3D room scan
    
    public init(roomObject: MDLAsset) {
        self._roomObject = roomObject
        // For now, the rest of the properties are hardcoded
        self._title = "Scan 1"
        self._type = "Room"
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
    
    public var roomObject: MDLAsset {
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

