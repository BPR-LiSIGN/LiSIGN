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
    
    @State private var selectedIndex: Int = 1
    @State var showAddProduct: Bool = false
//    var products = [Product]()
    var viewModel = ReadProductsViewModel()
    @State var testName: String = ""

    
    private let categories_ = ["Products", "Favorites"]
 
    
    @ObservedObject  var viewmodelProduct = ProductsViewModel()
    var products = ProductsViewModel().products

    
    var body: some View {

        ScrollView {
//            Button {
//                viewmodelProduct.getAllProducts()
//                print("idk" , products.count)
//
//            } label: {
//                Text("\(products.count)")
//
//
//           }
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)],spacing: 15){
//                products.count
                ForEach(products, id: \.id) { product in
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
            VStack {
//                Text([products])
//                Text(products[0].name)
            }
             
        }
    
    }
    struct ProductList_Previews: PreviewProvider {
        static var previews: some View {
            ScrollView {
                
                ProductList()
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
    
    
    
    
    
    
    
//    var body: some View {
//            VStack{
//                HStack {
//                    ForEach(0 ..< categories_.count) { i in
//                        Button(action: {selectedIndex = i}) {
//                            CategoryView_(isActive: selectedIndex == i, text: categories_[i])
//                        }
//                    }
//
//
//
//
//                    }
////                NavigationView{
////                    NavigationLink(
////                        "add", destination: AddProductView())
////
////
////                }
//
//                HStack {
//
//                    Text("hm")
////                        "\(products.count) \(products.count > 1 ? "products" : " product")")
//                        .font(.headline)
//                        .fontWeight(.medium)
//                        .opacity(0.7)
//
//                    Spacer()
////                    if test._name != nil {
////                        Text(test._name!)
////                                            } else {
////                        Text("Nothing")
////                    }
//                }
//                Button{
//
//                    ProductsViewModel().productObservation()
//                    print("pressedd", ProductsViewModel().products)
//                } label: {
//                    Text("Read")
//                }
//                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)],spacing: 15)
//                {
//                    ForEach(products, id: \.name) { product in
//                        NavigationLink(destination: ProductDetailCard(product: product)) {
//                            ProductCard_()
//                        }
//                    }
//                    .padding(.top)
//                }
//                .padding(.horizontal)
//            }
//
//
//
//    }
//    struct ProductList_Previews: PreviewProvider {
//        static var previews: some View {
//            ScrollView {
//
//                ProductList(products: Product.all)
//            }
//        }
//    }
//    struct CategoryView_: View {
//        let isActive: Bool
//        let text: String
//        var body: some View {
//            VStack (alignment: .leading, spacing: 0) {
//                Text(text)
//                    .font(.system(size: 18))
//                    .fontWeight(.medium)
//                    .foregroundColor(isActive ? Color("Brown") : Color.black.opacity(0.5))
//                if (isActive) { Color("Brown")
//                        .frame(width: 15, height: 2)
//                        .clipShape(Capsule())
//                }
//            }
//            .padding(.trailing)
//        }
//    }

