//
//  RoomDAO.swift
//  LiSIGN
//
// This class performs CRUD methods for the scanned rooms
// Disclaimer: The Update method will not be implemented, since the user won't be able to change anything object in the database

import Foundation
import Firebase
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase

class RoomDAO {
    static let shared = RoomDAO() // For Singleton pattern
    let userId = Auth.auth().currentUser?.uid
    let database = Database.database().reference()
    
    private init() {} // private for Singleton pattern
    
    // CREATE
    func addRoomToDB(_roomId: String, _roomObject: Room) {
        database.child("user").child(userId!).child("scanned-rooms").child(_roomId).setValue(_roomObject, withCompletionBlock: { err, ref in
            if let error = err {
                print("scannedRoom was not saved: \(error.localizedDescription)")
            } else {
                print("scannedRoom saved successfully!!")
            }
        })
    }
    
    // READ
    func getRoomFromDB(_roomId: String) {
        let roomRef = self.database.child("user").child(userId!).child("scanned-rooms").child(_roomId)
        
        roomRef.observeSingleEvent(of: .value, with: { snapshot in
            let roomDict = snapshot.value as! [String: Any]
            let title = roomDict["title"] as! String
            let image = roomDict["image"] as! String
            let type = roomDict["type"] as! String
            let roomObject = roomDict["roomObject"]! as AnyObject // Should be MDLAsset
            print(roomDict, title, image, type, roomObject)
        })
        
    }
    func getAllRoomsFromDB() {
        let allRooms = self.database.child("user").child(userId!).child("scanned-rooms")
        
        allRooms.observeSingleEvent(of: .value, with: { snapshot in
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                let roomDict = snap.value as! [String: Any] // Maybe this should be Room??
                let title = roomDict["title"] as! String
                let image = roomDict["image"] as! String
                let type = roomDict["type"] as! String
                let roomObject = roomDict["roomObject"]! as AnyObject // Should be MDLAsset
                print(roomDict, title, image, type, roomObject)
            }
        })
    }
    
    // DELETE
    func removeRoomFromDB(_roomId: String, _roomObject: Room) {
        database.child("user").child(userId!).child("scanned-rooms").child(_roomId).removeValue()
    }
}
