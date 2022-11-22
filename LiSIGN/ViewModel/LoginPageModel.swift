//
//  LoginPageModel.swift
//  LiSIGN_login
//

import SwiftUI
import FirebaseAuth
import FirebaseCore
import Firebase
import FirebaseDatabase

class LoginPageModel: ObservableObject {
    
    // TODO: Change the methods to call the user repository
    
    let firebaseAuth = Auth.auth()
    
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
    
    func Logout() { // Change this to call repository method
        do {
            try firebaseAuth.signOut()
            // Not sure if it is: try? FirebaseManager.shared.auth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %", signOutError)
        }
    }
    
}
