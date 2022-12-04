//
//  SidebarViewModel.swift
//  LiSIGN
//
//  Created by Lenka Orinčáková on 12/4/22.
//

import Foundation
enum SidebarViewModel: Int, CaseIterable {
case logout
    
    var name: String {
        switch self {
        case .logout: return "Logout"
        }
    }
    
    var imageName: String {
        switch self {
        case .logout: return "arrow.left.square"
        }
    }
}
