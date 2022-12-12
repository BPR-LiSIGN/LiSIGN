//
//  AppTabBarView.swift
//  LiSIGN
//

import SwiftUI
struct AppTabBarView: View {
    
    @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = .Rooms
    @State private var showSidebar = false

    
    // instances of each tab-view
    var roomsView = RoomsView()
    var marketPlaceView = MarketPlaceView()
    var productsView = ProductsView()
    
    var body: some View {
        ZStack(alignment: .topLeading) {
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
                
            }.navigationBarHidden(showSidebar)
            
            if showSidebar {
                ZStack{
                    Color(.black).opacity(showSidebar ? 0.25 : 0.0)
                }.onTapGesture {
                    withAnimation (.easeInOut) {
                        showSidebar = false
                    }
                }
                .ignoresSafeArea()
                
            }
            
            SidebarView(viewModel: LoginPageModel())
                .frame(width:250)
                .offset(x:showSidebar ? 0 :-300, y:0)
                .background(showSidebar ? Color.white : Color.clear )
        }.toolbar {
            ToolbarItem(placement: .navigationBarLeading)
            {Button{
                withAnimation(.easeInOut){
                    showSidebar.toggle()
                }
            }
            label: {
//                Circle()
                Image(systemName: "person.fill")
                    
                    .frame(width: 32, height: 32)
            }
            }
        }
    }
}

struct AppTabBar_Previews: PreviewProvider {
    
    static var previews: some View {
        AppTabBarView()
            .environmentObject(ProductsViewModel())
    }
}
