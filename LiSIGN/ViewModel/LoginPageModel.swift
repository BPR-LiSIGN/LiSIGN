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
        print(email)
        let object: [String: Any] = [
            "email" : email,
            "name" : "lenka",
            "roomId" : roomId + 1,
            "productId": productId + 1,
        ]
//        database.child("user").child(uid!).setValue(object)
        database.child("user").setValue(object)

    }
//    @objc func getUserInfo(){
//        let database = Database.database().reference()
//
//        let defaults = UserDefaults.standard
//        guard let uid = Auth.auth().currentUser?.uid else {
//            print("user doesn't exist")
//            return
//        }
//        database.child("user").child(uid).getData{(error,snapshot) in
//            if let error = error {
//                print("Error getting data \(error)")
//            }
//            else {
//           snapshot.value as? String
//
//                print(snapshot.value!)
//                            }
//
//        }
//        (.value, with: {(snapshot) in
//            if let dictionary = snapshot.value as? [String: Any] {
//                let email = dictionary["email"] as! String
//
//                defaults.set(email, forKey: "userEmailKey")
//
//            }
//        })
                                  
//        self.ref.child("users/\(user.uid)/username").getData { (error, snapshot) in
//            if let error = error {
//                print("Error getting data \(error)")
//            }
//            else if snapshot.exists() {
//                print("Got data \(snapshot.value!)")
//            }
//            else {
//                print("No data available")
//            }
//        }
                                                  
    
    
    }
