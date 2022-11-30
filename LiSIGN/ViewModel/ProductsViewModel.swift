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
    @Published  var products : [Product] = []
    @Published private var loginPageModel = LoginPageModel()

    func getProduct(id: String)
    {
        ProductRepository.shared.getProduct(id: id)
    }
    
    func getAllProducts()
    {
        ProductRepository.shared.getAllProducts()
    }
    
    //the connection with the real database
    init(){
    }
}
