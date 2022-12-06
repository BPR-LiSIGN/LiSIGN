//
//  Product.swift
//  LiSIGN
//
//  Created by Lenka Orinčáková on 11/3/22.
//

import SwiftUI

class Product: Identifiable, Codable {
//    var viewModel = ReadProductsViewModel()
    
    var id = NSUUID().uuidString
    var name : String
    var image : String?
    var description: String
    var info : String
    var datePublished: String?
    
    init(name: String, description: String, info:String ) {
        self.name = name
        self.description = description
        self.info = info
    }
    
    public var _name: String {
        get { return self.name}
        set {self.name = newValue}
    }
    
    
    
}

extension Product {
    static let all: [Product] = [
        Product (name: "lllllll", description: "This is just the demo 1", info: "some info 1"),
        Product(name: "Luxunnr", description: "This is just the demo 2", info: "some info 2"),
        Product(name: "Luxury chair", description: "This is just the demo 2", info: "some info 2"),
        Product(name: "Luxuryjjjchair", description: "This is just the demo 2", info: "some info 2"),
        Product(name: "Luxurynnn chair", description: "This is just the demo 2", info: "some info 2"),
        Product(name: "Luxurynnn chair", description: "This is just the demo 2", info: "some info 2")
    ]
}
