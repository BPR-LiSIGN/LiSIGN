//
//  MarketPlaceView.swift
//  LiSIGN
//

import SwiftUI

struct MarketPlaceView: View {
    var body: some View {
        Text("RoomsView")
        NavigationView{
            ZStack{
                Color.blue
            }
            .navigationTitle("MarketPlace")
        }
    }
}

struct MarketPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        MarketPlaceView()
    }
}
