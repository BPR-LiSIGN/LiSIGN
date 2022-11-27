//
//  HomePage.swift
//  LiSIGN
//

// Probably this file can be removed

import SwiftUI

struct HomePage: View {
    var body: some View {
        TabView{
            RoomsView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Rooms")
                }
            MarketPlaceView()
                .tabItem{
                    Image(systemName: "store")
                    Text("Marketplace")
                }
            ProductsView()
                .tabItem{
                    Image(systemName: "products")
                    Text("Objects")
                }
            
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
            .previewDevice("iPhone 14 Pro")
    }
}
