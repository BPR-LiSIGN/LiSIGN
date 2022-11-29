//
//  RoomRepository.swift
//  LiSIGN
//

import Foundation
import ModelIO
import FirebaseAuth
import Firebase
import FirebaseCore
import FirebaseDatabase

class RoomRepository: ObservableObject {
    static let shared = RoomRepository()
    
    private init(){}
    
    func addRoom(_roomId: String, _roomObject: Room) {
        RoomDAO.shared.addRoomToDB(_roomId: _roomId, _roomObject: _roomObject)
    }
    
    func getRoom(_roomObject: Room) { // Not sure if I need the userID or create a roomId
        RoomDAO.shared.getRoomFromDB(_roomObject: _roomObject)
    }
    
    func getAllRooms() {
        RoomDAO.shared.getAllRoomsFromDB()
    }
    
    func removeRoomFromDB(_roomId: String, _roomObject: Room){
        RoomDAO.shared.removeRoomFromDB(_roomId: _roomId, _roomObject: _roomObject)
    }
}
