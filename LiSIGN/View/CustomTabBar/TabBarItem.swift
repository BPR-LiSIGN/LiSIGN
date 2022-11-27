//
//  TabBarItem.swift
//  LiSIGN
//

import Foundation
import SwiftUI

//struct TabBarItem: Hashable { // It's Hashable so that it can be used in a foreach loop
//    let iconName: String
//    let title: String
//    let color: Color
//}

enum TabBarItem: Hashable {
    case Rooms, Marketplace, Objects

    
    var iconName: String {
        switch self {
        case .Rooms: return "house"
        case .Marketplace: return "eurosign"
        case .Objects: return "lamp.desk"

        }
    }
    
    var title: String {
        switch self {
        case .Rooms: return "Rooms"
        case .Marketplace: return "Marketplace"
        case .Objects: return "Objects"
        }
    }
    
    var color: Color {
        switch self {
        case .Rooms: return Color.red
        case .Marketplace: return Color.blue
        case .Objects: return Color.orange

        }
    }
}
