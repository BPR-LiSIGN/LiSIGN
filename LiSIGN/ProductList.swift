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
            VStack{
                HStack {
                    ForEach(0 ..< categories_.count) { i in
                        Button(action: {selectedIndex = i}) {
                            CategoryView_(isActive: selectedIndex == i, text: categories_[i])
                        }
                    }
                    
                   
                
                        
                    }
//                NavigationView{
//                    NavigationLink(
//                        "add", destination: AddProductView())
//
//
//                }
                
                HStack {
                    
                    Text(testName)
//                        "\(products.count) \(products.count > 1 ? "products" : " product")")
                        .font(.headline)
                        .fontWeight(.medium)
                        .opacity(0.7)
                    
                    Spacer()
//                    if test._name != nil {
//                        Text(test._name!)
//                                            } else {
//                        Text("Nothing")
//                    }
                }
                Button{
                    
                    observeProducts()
                    print("pressedd")
                } label: {
                    Text("Read")
                }
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)],spacing: 15)
                {
                    ForEach(products, id: \.name) { product in
                        NavigationLink(destination: ProductDetailCard(product: product)) {
                            ProductCard_(product: product)
                        }
                    }
                    .padding(.top)
                }
                .padding(.horizontal)
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
                    .foregroundColor(isActive ? Color("Brown") : Color.black.opacity(0.5))
                if (isActive) { Color("Brown")
                        .frame(width: 15, height: 2)
                        .clipShape(Capsule())
                }
            }
            .padding(.trailing)
        }
    }
}
