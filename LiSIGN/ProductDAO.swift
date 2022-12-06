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

class ProductDAO {
    static let shared = ProductDAO() // For Singleton pattern
    let userId = Auth.auth().currentUser?.uid
    let database = Database.database().reference()
    @Published var products: [Product] = []
    @Published var product: [Product] = []


    
    private init() {} // private for Singleton pattern
    
    // CREATE
    func addProductToDB(id: String, name: String, description: String, info: String, datePublished: String) {
        database.child("user").child(userId!).child("scannedObjects").child("productsId").child(id).child("name").setValue(name, withCompletionBlock: { err, ref in
            if let error = err {
                print("scanned object was not saved: \(error.localizedDescription)")
            } else {
                print("scanned object saved successfully!!")
            }
        })
    }
    
    // READ
    func getProductFromDB(id: String) {
        database.child("user").child(userId!).child("scannedObjects").child("productsId").child(id).observe(.value, with: { [self] snapshot in
        
            for child in snapshot.children {
                if let childSnapshot = child as? DataSnapshot,
                   let dict = childSnapshot.value as? [String:Any],
                   let name = dict["name"] as? String,
                   let description = dict["description"] as? String,
                   let info = dict["info"] as? String
                    {
                    var p = Product(name: name, description: description, info: info)
                    self.product.append(p)

                    Swift.print("-------name in dao: " + p.name )
                }
                
            }
            })
            
        
        }
//        let databaseHandle = database.observe(DataEventType.value, with: { snapshot in
//
//        })
    
//    func getProductFromDB(name: String, description: String, info: String) {
//
////        let databaseHandle = database.observe(DataEventType.value, with: { snapshot in
////
////        })
//    }
    
    func getAllPRoductsFromDB()  {
        let allProducts = database.child("user")
            .child("qdmvwiGBElSnXrmSAgX8ezMRsQ93")
            .child("scannedObjects")
            .child("productsId")
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
                   let name = dict["name"] as? String,
                   let description = dict["description"] as? String,
                   let info = dict["info"] as? String
                    {
                    var p = Product(name: name, description: description, info: info)
                    self.products.append(p)

                    Swift.print("-------name in dao: " + p.name )
                    Swift.print("-------name in dao: ", self.products.count )

                }
                }
            })
        print("below the stuff : ", products.count )

    }
    
    
    
    
//    func getAllRoomsFromDB() -> [Room] {
//    let allRooms = self.database.child("user").child(userId!).child("scanned-rooms")
//
//    allRooms.observeSingleEvent(of: .value, with: { snapshot in
//        for child in snapshot.children {
//            let snap = child as! DataSnapshot
//            let roomDict = snap.value as! [String: Any] // Maybe this should be Room??
//            let title = roomDict["title"] as! String
//            let image = roomDict["image"] as! String
//            let type = roomDict["type"] as! String
//            let roomObject = roomDict["roomObject"]! as AnyObject // Should be MDLAsset
//            print(roomDict, title, image, type, roomObject)
//        }
//    })
//
//    // TODO: transform data from firebase into array of Rooms
//    return allRooms
//}

    
    // DELETE
    func removeProductFromDB(id: String, name: String) {
//        database.child("user").child(userId!).child("scanned-rooms").child(id).removeValue()
    }
}
