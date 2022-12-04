//
//  ProductList.swift
//  LiSIGN
//
//  Created by Lenka Orinčáková on 11/3/22.
//

import SwiftUI
import Firebase
import FirebaseDatabase


struct ProductList: View {
    var products: [Product]
    @State private var selectedIndex: Int = 1
    @State var showAddProduct: Bool = false
//    var products = [Product]()
//    var test = ReadProductsViewModel()
    @State var testName: String = ""

    
    private let categories_ = ["Products", "Favorites"]
    
    func observeProducts(){
        let productsRef = Database.database().reference().child("Product")

        productsRef.observe(.value, with: { snapshot in

            for child in snapshot.children {
                if let childSnapshot = child as? DataSnapshot,
                   let dict = childSnapshot.value as? [String:Any],
                   let name = dict["name"] as? String,
                    let description = dict["description"] as? String,
                   let info = dict["info"] as? String,
                   let image = dict["image"] as? String,
                   let datePublished = dict["datePublished"] as? String
                    {
                    Swift.print("product: " + name + " description: " + description )

                }


            }

        })


        }


    
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)],spacing: 15){
//                products.count
                ForEach(products, id: \.name) { product in
                    NavigationLink(destination: ProductDetailCard(product: product)) {
                        ProductCard_(product: product)
                    }.padding(.top) .padding(.bottom)
                }
//                ForEach(0..<10, id: \.self ) { product in
                
//                    ProductCard_(product: product)
//                Button(action: {selectedIndex = i}) {
//                    CategoryView_(isActive: selectedIndex == i, text: categories_[i])
//                    if(selectedIndex == 2){ FavoritesView()}
//                }
            
            
            }.padding(.horizontal)
             
        }
    
    }
    struct ProductList_Previews: PreviewProvider {
        static var previews: some View {
            ScrollView {
                
                ProductList(products: Product.all)
            }
        }
    }
    struct CategoryView_: View {
        let isActive: Bool
        let text: String
        var body: some View {
            VStack (alignment: .leading, spacing: 0) {
                Text(text)
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                    .foregroundColor(isActive ? Color(.brown) : Color.black.opacity(0.5))
                if (isActive) { Color(.brown)
                        .frame(width: 15, height: 2)
                        .clipShape(Capsule())
                }
            }
            .padding(.trailing)
        }
    }
}
