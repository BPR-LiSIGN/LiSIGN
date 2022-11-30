//
//  LoginPageModel.swift
//  LiSIGN_login
//
//  Created by Juan Trebolle on 23/09/2022.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore
import Firebase
import FirebaseDatabase

class LoginPageModel: ObservableObject {
    
    // Login Properties...
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    @Published var roomId: Int = 789
    @Published var productId: Int  = 0
    @Published var uid = Auth.auth().currentUser?.uid
    @Published var emailss = Auth.auth().currentUser?.email


    
    // Register Properties
    @Published var registerUser: Bool = false
    @Published var re_Enter_Password: String = ""
    @Published var showReEnterPassword: Bool = false
     var errorText: Bool = false
     let database = Database.database().reference()
    
    // Login Call...
    func Login(){
        
        Auth.auth().signIn(withEmail:email, password: password)
        {
            result, error in
            if error != nil {print(error!.localizedDescription)}
                }
    }
    
    func Register() {
        Auth.auth().createUser(withEmail: email, password: password)
        {
            result, error in
            if error != nil {print(error!.localizedDescription)}
        }
    }
    func ForgotPassword(){
        // Do Action here...
    }
    @objc  func addUser() {
        let uid = Auth.auth().currentUser?.uid
        let _email = Auth.auth().currentUser?.email
        print(email)
        let object: [String: Any] = [
            "email" : email,
            "name" : "lenka",
            "roomId" : roomId + 1,
            "productId": productId + 1,
        ]
        
        //this one is for scanned rooms with object of room
        database.child("user").child("user id").child("scanned rooms").child("room id").setValue(object)
        
        //this one is for products rooms with object of product
        database.child("user").child("user id").child("scanned objects").child("object id").setValue(object)


//        database.child("user").child(uid!).setValue(object)
        print("-------user id is: " + uid!)
    }
   
                                                  
    
    
    }
