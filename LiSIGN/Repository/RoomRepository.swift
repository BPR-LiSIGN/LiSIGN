//
//  RoomRepository.swift
//  LiSIGN
// This class adds a layer between the data and the user.
//
import Foundation
import ModelIO
import FirebaseAuth
import Firebase
import FirebaseCore
import FirebaseDatabase

class RoomRepository: ObservableObject {
    static let shared = RoomRepository()
    @Published var rooms = [Room]() // getAllRooms
    
    private init(){}
    
    func addRoom(_roomId: String, _roomObject: Room) {
        RoomDAO.shared.addRoomToDB(_roomId: _roomId, _roomObject: _roomObject)
    }
    
    func getRoom(_roomId: String) { // Not sure if I need the userID or create a roomId
        RoomDAO.shared.getRoomFromDB(_roomId: _roomId)
    }
    
    func getAllRooms() -> [Room] {
        // RoomDAO.shared.getAllRoomsFromDB()
        
        let database = Database.database().reference()
        let userId = Auth.auth().currentUser?.uid
        let allRooms = database.child("user")
            //.child(userId!) //?? "qdmvwiGBElSnXrmSAgX8ezMRsQ93")
            .child("scannedRooms")
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
        
        print("below the stuff : ", [rooms] )
//        ProductRepository.shared.getAllProducts()
//        print("--this is in viewmodel: ", ProductDAO.shared.products.count)
        
        return rooms

        
        // TODO: transform data from firebase into array of Rooms
        // return allRooms
    }
    
    func removeRoomFromDB(_roomId: String, _roomObject: Room){
        RoomDAO.shared.removeRoomFromDB(_roomId: _roomId, _roomObject: _roomObject)
    }
}
