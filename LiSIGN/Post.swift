//
//  Post.swift
//  LiSIGN
//
//  Created by Lenka Orinčáková on 11/24/22.
//

import Foundation

class Post {
    var id: String
    var user: User
    var name: String
    var description:String
    
    init(id: String, user: User, name: String, description: String) {
        self.id = id
        self.user = user
        self.name = name
        self.description = description
    }
}
