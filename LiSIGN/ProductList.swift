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
 
    
    @StateObject private var viewmodelProduct = ProductsViewModel()

    
    var body: some View {
        NavigationView {
            List(viewmodelProduct.products) { product in
                HStack {
                    VStack(alignment: .leading) {
                        Text(product.name).font(.title3).bold()
                    }
                    Spacer()
                    AsyncImage(url: URL(string: product.description)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .shadow(radius: 2)
                                .frame(width: 90, height: 90, alignment: .center)
                        case .failure:
                            Color.gray
                                .clipShape(Circle())
                                .shadow(radius: 2)
                                .frame(width: 90, height: 90, alignment: .center)
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
            }.onAppear {
            }
//            .onDisappear {
//                viewModel.stopListening()
//            }
            .navigationTitle("Products")
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

