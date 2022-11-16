//
//  ContentView.swift
//  LiSIGN
//
//  Created by Lenka Orinčáková on 9/27/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       // OnBoardingPage()
       AppTabBarView()
       // RoomsView()
       // ScanRoomView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ContentView()
        }
    }
    
}
