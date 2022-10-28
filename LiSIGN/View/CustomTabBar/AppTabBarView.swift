//
//  AppTabBarView.swift
//  LiSIGN
//

import SwiftUI
struct AppTabBarView: View {
    
    @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = .Rooms
    
    // instances of each tab-view
    var roomsView = RoomsView()
    var marketPlaceView = MarketPlaceView()
    var productsView = ProductsView()
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            // Color.blue
            roomsView
                .tabBarItem(tab: .Rooms, selection: $tabSelection)
            
            // as an alternative to the eurosign icon, "magnifyingglass"
            // Color.red
            marketPlaceView
                .tabBarItem(tab: .Marketplace, selection: $tabSelection)
            
            productsView
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
