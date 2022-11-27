//
//  ProductDetailCard.swift
//  LiSIGN
//
//  Created by Lenka Orinčáková on 11/3/22.
//

import SwiftUI
import Firebase
import FirebaseDatabase


struct ProductDetailCard: View {
    var product: Product
    var ref = Database.database().reference()
    
    
    @State var _name: String = ""
    @State var _description: String = ""
    @State var _info : String = ""
    
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
          
            AsyncImage(url: URL(string: product.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                  
            }
        placeholder: {
                Image(systemName: "lamp.desk")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
                .foregroundColor(.white.opacity(0.7))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
               
            
        }
        .frame(height: 300)
        .background(Color.purple)
            
            VStack(spacing:30)
            {
                
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
                    Button{
//                        ReadProductsViewModel().observeProducts()
                        print("pressedd in product detail card")
                    } label: {
                        Text("Update")
                    }
                   
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal)
        }
        .ignoresSafeArea(.container, edges: .top)
        
    }
}
struct ProductDetailCard_Previews: PreviewProvider{
    static var previews: some View {
        
        ProductDetailCard(product: Product.all[0])
    }
}
