//
//  LoginPageModel.swift
//  LiSIGN_login
//
//  Created by Juan Trebolle on 23/09/2022.
//

import SwiftUI

class LoginPageModel: ObservableObject {
    
    // Login Properties...
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    
    // Register Properties
    @Published var registerUser: Bool = false
    @Published var re_Enter_Password: String = ""
    @Published var showReEnterPassword: Bool = false
    
    // Login Call...
    func Login(){
        // Do Action here...
    }
    
    func Register(){
        // Do Action here...
    }
    
    func ForgotPassword(){
        // Do Action here...
    }
    
}
