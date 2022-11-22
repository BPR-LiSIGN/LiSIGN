//
//  ContentView.swift
//  LiSIGN
//
//  Created by Lenka Orinčáková on 9/27/22.
//

import SwiftUI

struct ContentView: View {
    var sidebar = Sidebar()
    var body: some View {
        // OnBoardingPage()
        // RoomsView()
        sidebar
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ContentView()
        }
    }
    
}
