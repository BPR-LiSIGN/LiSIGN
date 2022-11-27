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
    @Published private (set) var products : [Product] = []
    @Published private var loginPageModel = LoginPageModel()
    
    private let database = Database.database().reference()
    
    //the connection with the real database
    init(){
        products = Product.all
    }
    private var idd = 0
    
    func addProduct(product:Product){
//        guard let user = UserService.currentUserProfile else { return }
//        let productsRef = database.child("products").childByAutoId()
//
//        let postProduct = [
//            "user": [
//                "uid": user.uid,
//                "email": user.email
//            ],
//            "name": product.name,
//            "description": product.description,
//            "info": product.info
//        ] as [String:Any]
//
//        productsRef.setValue(postProduct)
               var roomId = loginPageModel.email
                idd += 1
                [
                    "id" : product.id,
                    "userEmail": loginPageModel.roomId,
                    "name" : product.name,
                    "image" : product.image,
                    "description": product.description,
                    "info": product.info,
                    "datePublished": product.datePublished
                ] as [String: Any]
                database.child("Product").child("id_\(idd)").child("userEmail").setValue(roomId)
                database.child("Product").child("id_\(idd)").child("name").setValue(product.name)
                database.child("Product").child("id_\(idd)").child("description").setValue(product.description)
                database.child("Product").child("id_\(idd)").child("info").setValue(product.info)
                database.child("Product").child("id_\(idd)").child("date-published").setValue(product.datePublished)
            }
}
