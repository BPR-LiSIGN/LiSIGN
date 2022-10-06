//
//  AppTabBarView.swift
//  LiSIGN
//

import SwiftUI
struct AppTabBarView: View {
    
    @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = TabBarItem(iconName: "house", title: "Rooms", color: Color.red)
    
    var body: some View {
        defaultTabBarView;
        CustomTabBarContainerView(selection: $tabSelection) {
            Color.blue
                .tabBarItem(tab: TabBarItem(iconName: "house", title: "Rooms", color: Color.red), selection: $tabSelection)
            
            Color.red
                .tabBarItem(tab: TabBarItem(iconName: "lamp.desk", title: "Marketplace", color: Color.blue), selection: $tabSelection)
            
            Color.cyan
                .tabBarItem(tab: TabBarItem(iconName: "teddybear", title: "Objects", color: Color.brown), selection: $tabSelection)
            
            Color.green
                .tabBarItem(tab: TabBarItem(iconName: "heart", title: "Favourites", color: Color.orange), selection: $tabSelection)
        }
    }
}

struct AppTabBar_Previews: PreviewProvider {
    
    static let tabs: [TabBarItem] = [
        TabBarItem(iconName: "house", title: "Rooms", color: Color.red),
        TabBarItem(iconName: "lamp.desk", title: "Marketplace", color: Color.blue),
        TabBarItem(iconName: "teddybear", title: "Objects", color: Color.orange),
        TabBarItem(iconName: "heart", title: "Favorites", color: Color.cyan)
    ]
    
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
