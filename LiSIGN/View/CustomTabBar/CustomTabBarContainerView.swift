//
//  CustomTabBarContainerView.swift
//  LiSIGN
//

import SwiftUI

struct CustomTabBarContainerView<Content: View>: View {
    
    @Binding var selection: TabBarItem
    let content: Content
    @State private var tabs: [TabBarItem] = [
        TabBarItem(iconName: "house", title: "Rooms", color: Color.red),
        TabBarItem(iconName: "lamp.desk", title: "Marketplace", color: Color.blue),
        TabBarItem(iconName: "teddybear", title: "Objects", color: Color.orange),
        TabBarItem(iconName: "heart", title: "Favorites", color: Color.cyan)
    ]
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack  {
                content
            }
            CustomTabBarView(tabs: tabs, selection: $selection)
        }
    }
}

struct CustomTabBarContainerView_Previews: PreviewProvider {
    static let tabs: [TabBarItem] = [
        TabBarItem(iconName: "house", title: "Rooms", color: Color.red),
        TabBarItem(iconName: "lamp.desk", title: "Marketplace", color: Color.blue),
        TabBarItem(iconName: "teddybear", title: "Objects", color: Color.orange),
        TabBarItem(iconName: "heart", title: "Favorites", color: Color.cyan)
    ]

    static var previews: some View {
        CustomTabBarContainerView(selection: .constant(tabs.first!)) {
            Color.red
        }
    }
}
