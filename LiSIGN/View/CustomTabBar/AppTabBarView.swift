//
//  AppTabBarView.swift
//  LiSIGN
//

import SwiftUI
struct AppTabBarView: View {
    
    @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = .Rooms
    
    var body: some View {
        defaultTabBarView;
        CustomTabBarContainerView(selection: $tabSelection) {
            Color.blue
                .tabBarItem(tab: .Rooms, selection: $tabSelection)
            
            // as an alternative to the eurosign icon, "magnifyingglass"
            Color.red
                .tabBarItem(tab: .Marketplace, selection: $tabSelection)
            
            Color.cyan
                .tabBarItem(tab: .Objects, selection: $tabSelection)
            
            Color.green
                .tabBarItem(tab: .Favorites, selection: $tabSelection)
        }
    }
}

struct AppTabBar_Previews: PreviewProvider {
    
    static var previews: some View {
        AppTabBarView()
    }
}

extension AppTabBarView {
    private var defaultTabBarView: some View {
        TabView(selection: $selection) {
            Color.red
                .tabItem {
                    Image(systemName: "house")
                    Text("Rooms")
                }
            Color.blue
                .tabItem {
                    Image(systemName: "eurosign")
                    Text("Marketplace")
                }
            Color.orange
                .tabItem {
                    Image(systemName: "lamp.desk")
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
