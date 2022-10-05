//
//  HomePage.swift
//  LiSIGN
//
//  Created by Juan Trebolle on 05/10/2022.
//

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
            
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
            .previewDevice("iPhone 14 Pro")
    }
}
