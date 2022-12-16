//
//  OnBoardingPage.swift
//  LiSIGN_login
//

import SwiftUI

// to use custom font on all pages...
let customFont = "Raleway-VariableFont_wght"

struct OnBoardingPage: View {
    // Showing Login Page...
    @State var showLoginPage: Bool = false
    var body: some View {
        VStack(alignment: .leading){
            Text("LiSIGN")
                .font(.custom(customFont, size: 55))
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Button {
                withAnimation{
                    showLoginPage = true
                }
            } label: {
                Text("Get started")
                    .font(.custom(customFont, size: 18))
                    .fontWeight(.semibold)
                    .padding(.vertical, 18)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1),
                            radius: 5, x: 5, y: 5)
                    .foregroundColor(Color.cyan)
            }
            .padding(.horizontal, 30)
            .offset(y: 100)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color.cyan
        )
        .overlay(
            
            Group{
                if showLoginPage{
                    LoginPage()
                        .transition(.move(edge: .bottom))
                }
            }
        )
    }
}

struct OnBoardingPage_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingPage()
            .previewDevice("iPhone 14 Pro")
    }
}

// Extending View to get Screen Bounds...
