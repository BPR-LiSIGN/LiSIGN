//
//  MarketPlaceView.swift
//  LiSIGN
//

import SwiftUI
import UIKit

struct MarketPlaceView: View {
    @State private var search: String = ""
    @State private var searching = false
    @State private var selectedIndex: Int = 1
    @EnvironmentObject var productsViewModel: ProductsViewModel
    var productsList = ProductsViewModel().productsList
    let columns = [
           GridItem(.flexible()),
           GridItem(.flexible())
       ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(#colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1))
                    .ignoresSafeArea()
                
              
                    VStack(alignment: .leading) {
                        
                        
                        TagLineView()
                        Text("Market place").font(.system(size: 30, weight: .bold, design: .default))
                            .padding(.horizontal)
                        
                        SearchBar(searchText: $search, searching: $searching)
                        Text("All")
                                .font(.system(size: 24, weight: .light, design: .default))
                                .padding(.horizontal)
                            
                            ScrollView (.vertical, showsIndicators: false) {
                                VStack(spacing:30)
                                {
                                    LazyVGrid(columns: columns, spacing: 20){
                        //                products.count
                                        ForEach(productsViewModel.productsList, id: \.id) { product in
                                            NavigationLink(destination: CardDetailed(product: product), label:{
                                                ProductCard_(product: product)
                                            })
                                        }
                                    }.padding(.horizontal)
                                }
                            }.padding(.top)
                    }
                }
            }.onAppear{ self.productsViewModel.getAllProductsFromList()}
        
    }
}

struct MarketPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        MarketPlaceView().environmentObject(ProductsViewModel())
        
    }
}
struct AppBarView: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Image("menu")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10.0)
            }

            Spacer()

//            Button(action: {}) {
//                Image(uiImage: #imageLiteral(resourceName: "Profile"))
//                    .resizable()
//                    .frame(width: 42, height: 42)
//                    .cornerRadius(10.0)
//            }
        }
        .padding(.horizontal)
    }
}
struct TagLineView: View {
    var body: some View {
        Text("Marketplace")
//            .font(.custom("PlayfairDisplay-Regular", size: 28))
            
            .font(.system(size: 36, weight: .bold, design: .default))
            .foregroundColor(Color("CustomGray"))
            
    }
}

struct storyboard: UIViewControllerRepresentable {
  
    func makeUIViewController(context content: Context) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(identifier: "main")
        return controller
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}


struct SearchAndScanView: View {
    @Binding var search: String
    var body: some View {
        HStack {
            HStack {
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Search Furniture", text: $search)
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.trailing, 8)

            Button(action: {}) {
                Image("Scan")
                    .padding()
                    .background(Color(.brown))
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}
