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
    @Published var productsList = [Product]()
    @Published var favoriteList = [Product]()


    func getProduct(id: String)
    {
        ProductRepository.shared.getProduct(id: id)
    }
   func getAllProductsFromList()->[Product]
    {
        let allProducts = database.child("productsList")
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
                    self.productsList.append(p)
                
                    self.productsList = productsList
                }
                Swift.print("-------from list  ", [productsList])

                }


            })
        
        print("below the stuff : ", [productsList] )
//        ProductRepository.shared.getAllProducts()
//        print("--this is in viewmodel: ", ProductDAO.shared.products.count)
        return productsList

        }
    
    func getAllProducts() -> [Product]
    {
        let allProducts = database.child("user")
            .child(userId!  )
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
                    print("---user id " + userId!)
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
    
    func getProductsFromFavoritesList() -> [Product]
    {
        let allProducts = database.child("user")
            .child(userId!)
            .child("favorites")
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
                    self.favoriteList.append(p)
                    print("---user id " + userId!)
               
                    self.favoriteList = favoriteList
                    print("thiss is favorites: ", favoriteList.count)
                }

                }


            })
        
        print("below the stuff : ", [favoriteList] )
//        ProductRepository.shared.getAllProducts()
//        print("--this is in viewmodel: ", ProductDAO.shared.products.count)
        return favoriteList

        }
    
    //the connection with the real database
    init(){
       
    }
}
