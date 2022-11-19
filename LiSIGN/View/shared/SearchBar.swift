//
//  SearchBar.swift
//  LiSIGN
//
//  Created by Juan Trebolle on 20/10/2022.
//

import Foundation
import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @Binding var searching: Bool
    
    var body: some View{
        ZStack{
            Rectangle()
                .foregroundColor(.white)
            HStack{
                Image(systemName: "magnifyingglass")
                TextField("Search...", text: $searchText) { startedEditing in
                    if startedEditing  {
                        withAnimation{
                            searching = true
                        }
                    }
                    
                } onCommit: {
                    withAnimation{
                        searching = false
                        UIApplication.shared.dismissKeyboard()
                    }
                }
            }
            .foregroundColor(Color("Brown"))
            .padding(.leading, 13)
        }
        .frame(height: 40)
        .cornerRadius(13)
        .padding()
    }
}
