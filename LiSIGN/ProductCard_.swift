//
//  ProductCard.swift
//  LiSIGN
//
//  Created by Lenka Orinčáková on 11/3/22.
//

import SwiftUI

struct ProductCard_: View {
//    var product: Product
    var viewModel = ReadProductsViewModel()
    var viewModelLogin = LoginPageModel()
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
        
        
        
        
        
        
        
        
        
        
        
//        VStack {
//            AsyncImage(url: URL(string: product.image)) { image in
//                image
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .overlay(alignment: .bottom) {
//                        Text(v)
//                            .font(.headline)
//                            .foregroundColor(.white)
//                            .shadow(color:.black, radius:3, x:0, y:0)
//                            .frame(maxWidth: 136)
//                            .padding()
//                    }
//            }
//        placeholder: {
//            Image(systemName: "lamp.desk")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 40, height: 40, alignment: .center)
//                .foregroundColor(.white.opacity(0.7))
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .overlay(alignment: .bottom) {
//                    Text(viewModelLogin.emailss!)
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .shadow(color:.black, radius:3, x:0, y:0)
//                        .frame(maxWidth: 136)
//                        .padding()
//                }
//
//        }
//    }
//        .frame(width: 160, height: 217, alignment: .top)
//        .background(Color(.purple))
//        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
//        .shadow(radius: 15)
//}


 struct ProductCard__Previews: PreviewProvider {
    static var previews: some View {
        ProductCard_()
    }
 }
