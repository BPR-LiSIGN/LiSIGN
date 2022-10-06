//
//  CustomTabBarView.swift
//  LiSIGN
//

import SwiftUI

struct CustomTabBarView: View {
    
    let tabs: [TabBarItem]
    @Binding var selection: TabBarItem
    
    var body: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static let tabs: [TabBarItem] = [
        TabBarItem(iconName: "house", title: "Rooms", color: Color.red),
        TabBarItem(iconName: "lamp.desk", title: "Marketplace", color: Color.blue),
        TabBarItem(iconName: "teddybear", title: "Objects", color: Color.orange),
        TabBarItem(iconName: "heart", title: "Favorites", color: Color.cyan)
    ]
    
    static var previews: some View {
        VStack {
            Spacer() // to push it down to the bottom
            CustomTabBarView(tabs: tabs, selection: .constant(tabs.first!))
        }
    }
}

extension CustomTabBarView {
    
    private func tabView(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(selection == tab ? tab.color : Color.gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(selection == tab ? tab.color.opacity(0.2) : Color.clear)
        .cornerRadius(10)
    }
    
    private func switchToTab(tab: TabBarItem) {
        withAnimation(.easeInOut) {
            selection = tab
        }
    }
}

struct TabBarItem: Hashable { // It's Hashable so that it can be used in a foreach loop
    let iconName: String
    let title: String
    let color: Color
}
