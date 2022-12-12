//
//  FavoritesView.swift
//  LiSIGN
//
//  Created by Lenka Orinčáková on 12/3/22.
//

import Foundation
import SwiftUI

struct FavoritesView: View {
    
//    @EnvironmentObject var productsViewModel: ProductsViewModel


    let columns = [
           GridItem(.flexible()),
           GridItem(.flexible())
       ]
    @EnvironmentObject var productsViewModel: ProductsViewModel
    var products = ProductsViewModel().favoriteList

    var body: some View {
       NavigationView {
            ScrollView{
                
                ScrollView {
                    
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)],spacing: 15){
                        //                products.count
                        ForEach(products, id: \.id) { product in
                            NavigationLink(destination: ProductDetailCard(product: product)) {
                                ProductCard_(product: product)
                                
                            }.padding(.top) .padding(.bottom)
                        }
                    }.padding(.horizontal)
                        .environmentObject(ProductsViewModel())
                }
            }
        }
       .environmentObject(ProductsViewModel()).onAppear{ self.productsViewModel.getProductsFromFavoritesList() }


    }}
struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        
            
            FavoritesView().environmentObject(ProductsViewModel())
        
    }
}

