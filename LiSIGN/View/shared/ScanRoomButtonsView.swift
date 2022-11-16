//
//  ScanRoomButtonsView.swift
//  LiSIGN
//

import SwiftUI

struct ScanRoomButtonsView: View {
    
    var body: some View {
        HStack(alignment: .center, spacing: 50) {
            Button ("Save") { // Save button
                
            }
            .scaledToFit()
            .foregroundColor(.primary)
            .cornerRadius(20)
            .frame(width: 40, height: 40)
            .padding()
            .background(.regularMaterial)
            
            Button ("Plane Detection") { // Plane Detection button
                
            }
            .scaledToFit()
            .foregroundColor(.primary)
            .cornerRadius(20)
            .frame(width: 40, height: 40)
            .padding()
            .background(.regularMaterial)
        
            Button ("Reset") { // Reset button
                
            }
            .scaledToFit()
            .foregroundColor(.primary)
            .cornerRadius(20)
            .frame(width: 40, height: 40)
            .padding()
            .background(.regularMaterial)
        }
    }
}

struct ScanRoomButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ScanRoomButtonsView()
    }
}
