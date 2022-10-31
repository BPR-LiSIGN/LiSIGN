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
     var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    
    // Register Properties
    @Published var registerUser: Bool = false
    @Published var re_Enter_Password: String = ""
    @Published var showReEnterPassword: Bool = false
     var errorText: Bool = false
    private let database = Database.database().reference()
    
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
        let object: [String: Any] = [
            "email" : email as NSObject,
            "name" : "lenka"
        ]
        database.child("user_\(Int.random(in: 0 ..< 100))").setValue(object)
    }
    
    }
