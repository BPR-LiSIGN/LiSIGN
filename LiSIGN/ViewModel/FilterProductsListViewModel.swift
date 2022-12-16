//
//  FilterProductsListViewModel.swift
//  LiSIGN
//
//  Created by Lenka Orinčáková on 12/3/22.
//

import Foundation

enum FilterProductsListViewModel: Int, CaseIterable {
    case productsList
//    case favoritesList
    
    var title: String
    {
        switch self {
        case .productsList: return "Products"
//        case .favoritesList: return "Favorites"
        }
    }
}
