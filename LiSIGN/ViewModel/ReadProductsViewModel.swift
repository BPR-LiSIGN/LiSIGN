////
////  ReadProductsViewModel.swift
////  LiSIGN
////
////  Created by Lenka Orinčáková on 11/24/22.
////
//
//import SwiftUI
//import Firebase
//import FirebaseDatabase
//
//class ReadProductsViewModel: ObservableObject{
//    
//    var ref = Database.database().reference()
//    @Published var furniture: [Product] = []
////   @State var _name: String = ""
//    
//    
//    func observeProducts(){
//        let productsRef = Database.database().reference().child("Product")
//        
//        productsRef.observe(.value, with: { [self] snapshot in
//        
//            
//            for child in snapshot.children {
//                if let childSnapshot = child as? DataSnapshot,
//                   let dict = childSnapshot.value as? [String:Any],
//                   let _name = dict["name"] as? Product
//                    {
//                    self.furniture.append(_name)
//                    Swift.print("_name in viewmodel: " + _name.name )
//                }
//        }
//        })
//        
//        }
//    
//}
//
//
