//
//  ProductDetailCard.swift
//  LiSIGN
//
//  Created by Lenka Orinčáková on 11/3/22.
//

import SwiftUI
import Firebase
import FirebaseDatabase
import SceneKit



struct ProductDetailCard: View {
    var product: Product
    
    @State var _name: String = ""
    @State var _description: String = ""
    @State var _info : String = ""
    var vm = ProductsViewModel()
    
//    func observeProducts(){
//        let productsRef = Database.database().reference().child("Product")
//
//        productsRef.observe(.value, with: { [self] snapshot in
//
//            for child in snapshot.children {
//                if let childSnapshot = child as? DataSnapshot,
//                   let dict = childSnapshot.value as? [String:Any],
//
//                    var name = dict["name"] as? String,
//                     var description = dict["description"] as? String,
//                    var info = dict["info"] as? String
//                     {
//                     Swift.print("maybe: " + name )
//                     self._name = name
//                    self._description = description
//                    self._info = info
//                    Swift.print("_name is: " + _name + " description is: " + _description + " info is: " + _info)
//                }
//            }
//        })
//        print("Print _name: " + self._name)
//        }
    
    
    var body: some View {
        ScrollView{
     
        placeholder: do {
                Image(systemName: "lamp.desk")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
                .foregroundColor(.white.opacity(0.7))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
               
            
        }
            
            VStack(spacing:30)
            {
                VStack{

                    SceneView(scene: SCNScene(named: "\(product.name).usdz"), options: [.autoenablesDefaultLighting, .allowsCameraControl])
                        
//                    (named: "\(product.name).usdz")
            }.frame(width: 400, height: 400)
                    
                Text(product.name)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                
                VStack(alignment: .leading, spacing: 30)
                {
                    Text(product.description)
                    
                    VStack(alignment: .leading, spacing:20)
                    {
                        Text("Info")
                            .font(.headline)
                        Text(product.info)
                        
                    }
                 
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
            .padding(.horizontal)
        }
        .ignoresSafeArea(.container, edges: .top)
        
    }
}
struct ProductDetailCard_Previews: PreviewProvider{
    static var previews: some View {
        
        ProductDetailCard(product: Product(name: "test name", description: "test desc", info: "test info"))
    }
}
