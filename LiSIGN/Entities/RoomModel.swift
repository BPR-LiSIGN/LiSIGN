//
//  Room.swift
//  LiSIGN
//

import Foundation
import SwiftUI
import ModelIO

public class Room: Identifiable {
    private var _id: String
    private var _title: String = ""
    private var _image: String = ""
    private var _description: String = ""
    //private var _roomObject: MDLAsset // MDLAsset is the type that LiDAR gives back for the 3D room scan
    
//    public init(roomObject: MDLAsset) {
//        self._roomObject = roomObject
//        // For now, the rest of the properties are hardcoded
//        self._title = "Scan 1"
//        self._type = "Room"
//    }
    public init(title: String, description: String) {
        self._id = NSUUID().uuidString
        self._title = title
        self._description = description
    }
    
    public var id: String {
        get {
            return self._id;
        }
    }
    
    public var title: String {
        get {
            return self._title;
        }
        set {
            self._title = newValue
        }
    }
    
    public var description: String {
        get {
            return self._description;
        }
        set {
            self._description = newValue
        }
    }
    
//    public var roomObject: MDLAsset {
//        get {
//            return self._roomObject;
//        }
//        set {
//            self._roomObject = newValue
//        }
//    }
}
