//
//  OnBoardingPage.swift
//  LiSIGN_login
//
//  Created by Juan Trebolle on 21/09/2022.
//

import SwiftUI

// TODO: Manage Fonts (see video to structure it well)
// TODO: Change background color to more blueish purple

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
            // Add floating effect on the image
            Image("bad3")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Button {
                // Not sure if this animation is working properly :/
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
                    .foregroundColor(Color.brown)
            }
            .padding(.horizontal, 30)
            .offset(y: 100)
            // Adding some Adjustments only for larger displays
            // .offset(y: getRect().height < 750 ? 100 : 40)
            
            Spacer()
        }
        .padding()
        // .padding(.top, getRect().height < 750 ? 0 : 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            //Color.purple // change the purple to something more blueish
            Color.brown
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
            .previewDevice("iPhone 13 Pro")
    }
}

// Extending View to get Screen Bounds...
