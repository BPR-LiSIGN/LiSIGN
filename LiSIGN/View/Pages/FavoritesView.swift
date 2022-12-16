//
//  FavoritesView.swift
//  LiSIGN
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
    var favorites = ProductsViewModel().favoriteList
    var favoritesMU = ["Cactus", "Flower tulip"]

    var body: some View {
        
        
        ScrollView {
        Text("Favorites")
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)],spacing: 15){
//                products.count
                    
                        VStack {

                            // AsyncImage(url: URL(string: product.image)) { image in cimage
                            Image("cactus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 90, alignment: .center)
                                .foregroundColor(.purple.opacity(0.7))
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .overlay(alignment: .bottom)
                            {
                                    HStack {
                                        Text("cactus")
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
                        .frame(width: 160, height: 217, alignment: .top)
                        .background(Color(.white))
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .shadow(radius: 15)
                    }.padding(.top) .padding(.bottom)
                VStack{

                    // AsyncImage(url: URL(string: product.image)) { image in cimage
                    Image("flower_tulip")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 90, alignment: .center)
                        .foregroundColor(.purple.opacity(0.7))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .overlay(alignment: .bottom)
                    {
                            HStack {
                                Text("Flower tulip")
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
                .frame(width: 160, height: 217, alignment: .top)
                .background(Color(.white))
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(radius: 15)
            }
                }
            }.padding(.horizontal)
        }
    
        
        
   
      


    }
struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        
            
            FavoritesView().environmentObject(ProductsViewModel())
        
    }
}

