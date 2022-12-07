//
//  ReadProductsViewModel.swift
//  LiSIGN
//
//  Created by Lenka Orinčáková on 11/24/22.
//

import SwiftUI
import Firebase
import FirebaseDatabase

class ReadProductsViewModel: ObservableObject{
    
    var ref = Database.database().reference()
    @Published var furniture: [Product] = []
//   @State var _name: String = ""
    
    
    func observeProducts(){
        let productsRef = Database.database().reference().child("Product")
        
        productsRef.observe(.value, with: { [self] snapshot in
        
            
            for child in snapshot.children {
                if let childSnapshot = child as? DataSnapshot,
                   let dict = childSnapshot.value as? [String:Any],
                   let _name = dict["name"] as? String,
                    let description = dict["description"] as? String,
                   let info = dict["info"] as? String,
                   let datePublished = dict["datePublished"] as? String,
                   let image = dict["image"] as? String
                {
                    var p = Product(name: _name, description: description , info: info)
                    self.furniture.append(p)
                    Swift.print("_name in viewmodel: " + p.name )
                }
        }
        })
        
        }
    
}


