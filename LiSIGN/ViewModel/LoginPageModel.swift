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

class LoginPageModel: ObservableObject {
    
    // Login Properties...
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    
    // Register Properties
    @Published var registerUser: Bool = false
    @Published var re_Enter_Password: String = ""
    @Published var showReEnterPassword: Bool = false
     var errorText: Bool = false
    
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
    
    }
