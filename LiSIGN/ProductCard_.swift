//
//  ProductCard.swift
//  LiSIGN
//
//  Created by Lenka Orinčáková on 11/3/22.
//

import SwiftUI

struct ProductCard_: View {
    var product: Product
    
    var body: some View {
        VStack {
            Button {
                //like
            } label: {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red.opacity(0.9))
                    .padding()
            }
            // AsyncImage(url: URL(string: product.image)) { image in cimage
            Image(systemName: "lamp.desk")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40, alignment: .center)
                .foregroundColor(.white.opacity(0.7))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay(alignment: .bottom) {
                    HStack {
                        Text(product.name)
                            .font(.headline)
                            .foregroundColor(.gray)
                            .shadow(color:.white, radius:3, x:0, y:0)
                            .frame(maxWidth: 136)
                            .padding()
                        Button{
                            //delete it
                        } label:{
                            Image(systemName: "trash")
                                .foregroundColor(.black.opacity(0.9))
                        }.padding()
                    
                    }
                }
    }
        .frame(width: 160, height: 217, alignment: .top)
        .background(Color(.white))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(radius: 15)
    }
}

 struct ProductCard__Previews: PreviewProvider {
    static var previews: some View {
        ProductCard_(product: Product.all[0])
    }
 }
