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
import FirebaseStorage

class RoomDAO {
    static let shared = RoomDAO() // For Singleton pattern
    let storage = Storage.storage().reference()
    let userId = Auth.auth().currentUser?.uid
    let database = Database.database().reference()
    @Published var rooms = [Room]() // getAllRooms
    
    private init() {} // private for Singleton pattern
    
    // CREATE
    func addRoomToDB(_roomId: String, _roomObject: Room) -> Void {
        database.child("user").child(userId!).child("scanned-rooms").child(_roomId).child("title").setValue(_roomObject.title, withCompletionBlock: { err, ref in
            if let error = err {
                print("scannedRoom was not saved: \(error.localizedDescription)")
            } else {
                print("scannedRoom saved successfully!!")
            }
        })
        database.child("user").child(userId!).child("scanned-rooms").child(_roomId).child("description").setValue(_roomObject.description, withCompletionBlock: { err, ref in
            if let error = err {
                print("scannedRoom was not saved: \(error.localizedDescription)")
            } else {
                print("scannedRoom saved successfully!!")
            }
        })
        
        // The next 3 lines were a trial to store the 3D models in Google Cloud Storage - not using it for now
//        guard _roomObject != nil else {return}
//        let roomObjectData = _roomObject.roomObject
//        storage.child("3d-scanned-rooms/")
    }
    
    // READ
    func getRoomFromDB(_roomId: String) {//-> Room {
        let roomRef = self.database.child("user").child(userId!).child("scanned-rooms")
        
        roomRef.observeSingleEvent(of: .value, with: { snapshot in
            let roomDict = snapshot.value as! [String: Any]
            let title = roomDict["title"] as! String
            let description = roomDict["description"] as! String
            var room = Room(title: title, description: description)
            Swift.print("-------getRoommmm - TITLE: " + room.title)
            Swift.print("-------getRoommmm - DESCRIPTION: " + room.description)
        })
        //return roomRef
    }
    
    func getAllRoomsFromDB() -> [Room] {
        let allRooms = database.child("user")
            //.child(userId!) //?? "qdmvwiGBElSnXrmSAgX8ezMRsQ93")
            .child("scannedRooms")
            .child("RoomId")
            .observe(.value,
                     with:
                        { [self]
                (
                    snapshot
                )
                in
        
                for child in snapshot.children {
                    if let childSnapshot = child as? DataSnapshot,
                       let dict = childSnapshot.value as? [String:Any],
                       let title = dict["title"] as? String,
                       let description = dict["description"] as? String
                    {
                        var r = Room(title: title, description: description)
                        self.rooms.append(r)
                        print("---user id " + userId!)
                        Swift.print("-------name in dao: " + r.title)
                        Swift.print("-------name in dao: ", rooms[0].title)
                        Swift.print("-----first ", [rooms] )
                        self.rooms = rooms
                    }
                }
            })
        
        return rooms
    }
    
    // DELETE
    func removeRoomFromDB(_roomId: String, _roomObject: Room) -> Void {
        database.child("user").child(userId!).child("scanned-rooms").child(_roomId).removeValue()
    }
}
