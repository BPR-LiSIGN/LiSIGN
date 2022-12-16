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
                print("name: scanned object saved successfully!! ")
            }
        })
        database.child("user").child(userId!).child("scannedObjects").child("productsId").child(id).child("description").setValue(description, withCompletionBlock: { err, ref in
            if let error = err {
                print("scanned object was not saved: \(error.localizedDescription)")
            } else {
                print("description: scanned object saved successfully!!")
            }
        })
        database.child("user").child(userId!).child("scannedObjects").child("productsId").child(id).child("info").setValue(info, withCompletionBlock: { err, ref in
            if let error = err {
                print("scanned object was not saved: \(error.localizedDescription)")
            } else {
                print("info: scanned object saved successfully!!")
            }
        })
    }
    func addProductToFavorites(id: String, name: String, description: String, info: String, datePublished: String) {
        database.child("user").child(userId!).child("favorites").child("productsId").child(id).child("name").setValue(name, withCompletionBlock: { err, ref in
            if let error = err {
                print("scanned object was not saved: \(error.localizedDescription)")
            } else {
                print("scanned object saved successfully!!")
            }
        })
    }
   func addProductToDBList(id: String, name: String, description: String, info: String, datePublished: String)
    {
        database.child("productsList").child("productsId").child(id).child("name").setValue(name, withCompletionBlock: { err, ref in
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
    
    // DELETE
    func removeProductFromDB(id: String, name: String) {
//        database.child("user").child(userId!).child("scanned-rooms").child(id).removeValue()
    }
}
