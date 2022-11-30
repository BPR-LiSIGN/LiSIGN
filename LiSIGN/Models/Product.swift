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

//extension Product {
//    static let all: [Product] = [
//        Product (name: "luxury", image: ",https://www.google.com/search?q=luxury+bed&rlz=1C5CHFA_enDK1017DK1017&tbm=isch&sxsrf=ALiCzsYavbmzoQTIPCLXxo7PLaW25a91IQ:1667491645132&source=lnms&sa=X&ved=0ahUKEwjf_7C5spL7AhXG_aQKHfWHDAgQ_AUI3ggoAQ&biw=1344&bih=670&dpr=1.25#imgrc=YCOJF9PiM-oIPM", description: "This is just the demo 1", info: "some info 1", datePublished: "2022-11-07"),
//        Product(name: "Luxury chair", image: "https://www.google.com/search?q=luxury+bed&rlz=1C5CHFA_enDK1017DK1017&tbm=isch&sxsrf=ALiCzsYavbmzoQTIPCLXxo7PLaW25a91IQ:1667491645132&source=lnms&sa=X&ved=0ahUKEwjf_7C5spL7AhXG_aQKHfWHDAgQ_AUI3ggoAQ&biw=1344&bih=670&dpr=1.25#imgrc=YCOJF9PiM-oIPM", description: "This is just the demo 2", info: "some info 2", datePublished: "2022-11-05")
//    ]
//}
