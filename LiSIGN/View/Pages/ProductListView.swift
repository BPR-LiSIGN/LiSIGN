//
//  FavoritesView.swift
//  LiSIGN
//
//  Created by Lenka Orinčáková on 12/3/22.
//

import Foundation
import SwiftUI

struct ProductListView: View {
    
    var products: [Product]
    
    @State var testName: String = ""
    
    var body: some View {
        
        Text("PRoducts")
        
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

