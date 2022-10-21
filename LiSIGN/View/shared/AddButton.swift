//
//  AddButton.swift
//  LiSIGN
//

import Foundation
import SwiftUI

struct AddButton: View {
    
    var body: some View {
//        Button("+") {
//            print("Opening camera to add room")
//        }
//        .cornerRadius(20)
//        .buttonStyle(.borderedProminent)
//        .tint(.cyan)
        
        // version 2.0 - This needs to be added to the TabBar somehow
        /**
         * This new version of the Plus button should be sitting in the TabBar as an option.
         *  When you click on it, it should open 2 floating options, one for adding a room, and another one for adding an object.
         *  The options and functionality are missing in the implementation.
         */
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .foregroundColor(.brown)
                    .frame(width:
                            geometry.size.width/7, height:
                            geometry.size.width/7)
                    .shadow(radius: 4)
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width/7-6,
                           height: geometry.size.width/7-6)
                    .foregroundColor(.white)
            }
            .offset(y: -geometry.size.height/8/2)
        }
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton()
    }
}
