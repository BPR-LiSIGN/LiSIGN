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

class ProductRepository: ObservableObject {
    static let shared = ProductRepository()
    
    private init(){}
    
    func addProduct(id: String, name: String, description: String, info: String, datePublished: String) {
        ProductDAO.shared.addProductToDB(id: id, name: name, description: description, info: info, datePublished: datePublished)
    }
    
    func getProduct(id: String) { // Not sure if I need the userID or create a roomId
        ProductDAO.shared.getProductFromDB(id: id)
    }
    
    func getAllProducts() {
        ProductDAO.shared.getAllPRoductsFromDB()
    }
    
    func removeProductFromDB(id: String, name: String){
        ProductDAO.shared.removeProductFromDB(id: id, name: name)
    }
}
