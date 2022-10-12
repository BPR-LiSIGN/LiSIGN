//
//  RoomsView.swift
//  LiSIGN
//

import SwiftUI

struct RoomsView: View {
    var body: some View {
        Text("RoomsView")
        NavigationView{
            ZStack{
                Color.red
            }
            .navigationTitle("Rooms")
        }
    }
}

struct RoomsView_Previews: PreviewProvider {
    static var previews: some View {
        RoomsView()
    }
}
