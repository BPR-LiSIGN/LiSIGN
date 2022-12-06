//
//  ProductsViewModel.swift
//  LiSIGN
//
//  Created by Lenka Orinčáková on 11/6/22.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore
import Firebase
import FirebaseDatabase

class ProductsViewModel: ObservableObject {
    //announce to subscribers when the values have changes
//    @Published  var products = ProductDAO.shared.products
    @Published private var loginPageModel = LoginPageModel()
    let userId = Auth.auth().currentUser?.uid
    let database = Database.database().reference()
//    @Published var products: [Product] = []
    @Published var products = [Product]()

    func getProduct(id: String)
    {
        ProductRepository.shared.getProduct(id: id)
    }
    
    func getAllProducts() -> [Product]
    {
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
                    Swift.print("-------name in dao: ", products[0].name )
                    Swift.print("-----first ", [products] )
                    self.products = products
                }
                Swift.print("-------second ", [products])

                }
                Swift.print("-------third ", [products])


            })
        
        print("below the stuff : ", [products] )
//        ProductRepository.shared.getAllProducts()
//        print("--this is in viewmodel: ", ProductDAO.shared.products.count)
        return products

        }
    
    
    //the connection with the real database
    init(){
       
    }
}
