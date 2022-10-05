//
//  AppTabBar.swift
//  LiSIGN
//

import SwiftUI

struct AppTabBar: View {
    
    @State private var selection: String = "home"
    
    var body: some View {
        TabView(selection: $selection) {
            Color.red
                .tabItem {
                    Image(systemName: "house")
                    Text("Rooms")
                }
            Color.blue
                .tabItem {
                    Image(systemName: "lamp.desk")
                    Text("Marketplace")
                }
            Color.orange
                .tabItem {
                    Image(systemName: "profile")
                    Text("Objects")
                }
            Color.cyan
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
        }
    }
}

struct AppTabBar_Previews: PreviewProvider {
    static var previews: some View {
        AppTabBar()
    }
}
