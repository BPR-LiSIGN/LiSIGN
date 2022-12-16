//
//  ProductList.swift
//  LiSIGN
//

import SwiftUI
import Firebase
import FirebaseDatabase


struct ProductList: View {
    
    @State private var selectedIndex: Int = 1
    @State var showAddProduct: Bool = false
//    var products = [Product]()
    @State var testName: String = ""

    
    private let categories_ = ["Products", "Favorites"]
 
    
    @ObservedObject  var viewmodelProduct = ProductsViewModel()
    var products = ProductsViewModel().products

    
    var body: some View {

        ScrollView {

            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)],spacing: 15){
//                products.count
                ForEach(products, id: \.id) { product in
                    NavigationLink(destination: ProductDetailCard(product: product)) {
                        ProductCard_(product: product)
                        
                    }.padding(.top) .padding(.bottom)
                }
            }.padding(.horizontal)
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
