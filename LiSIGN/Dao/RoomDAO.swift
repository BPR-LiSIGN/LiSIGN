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
        database.child("user").child(userId!).child("scanned-rooms").child("room-id").child(_roomId).setValue(_roomObject, withCompletionBlock: { err, ref in
            if let error = err {
                print("scannedRoom was not saved: \(error.localizedDescription)")
            } else {
                print("scannedRoom saved successfully!!")
            }
        })
    }
    
    // READ
    func getRoomFromDB(_roomObject: Room) {
//        let databaseHandle = database.observe(DataEventType.value, with: { snapshot in
//
//        })
    }
    
    func getAllRoomsFromDB() { // Change this to do roomObjects instead of Users
//        database.child("user").child(userId!).observeSingleEvent(of: .value, with: { snapshot in
//            // Get user value
//            let value = snapshot.value as? NSDictionary
//            // let _username = value?["username"] as? String ?? ""
//            // let user = User(username: _username)
//
//            // ..
//        }) { error in
//            print(error.localizedDescription)
//        }
    }
    
    // DELETE
    func removeRoomFromDB(_roomId: String, _roomObject: Room) {
        database.child("user").child(userId!).child("scanned-rooms").child(_roomId).removeValue()
    }
}
