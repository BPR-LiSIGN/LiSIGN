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
            AsyncImage(url: URL(string: product.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay(alignment: .bottom) {
                        Text(product.name)
                            .font(.headline)
                            .foregroundColor(.white)
                            .shadow(color:.black, radius:3, x:0, y:0)
                            .frame(maxWidth: 136)
                            .padding()
                    }
            }
        placeholder: {
            Image(systemName: "lamp.desk")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40, alignment: .center)
                .foregroundColor(.white.opacity(0.7))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay(alignment: .bottom) {
                    Text(product.name)
                        .font(.headline)
                        .foregroundColor(.white)
                        .shadow(color:.black, radius:3, x:0, y:0)
                        .frame(maxWidth: 136)
                        .padding()
                }
            
        }
    }
        .frame(width: 160, height: 217, alignment: .top)
        .background(Color(.purple))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(radius: 15)
}
}

 struct ProductCard__Previews: PreviewProvider {
    static var previews: some View {
        ProductCard_(product: Product.all[0])
    }
 }
