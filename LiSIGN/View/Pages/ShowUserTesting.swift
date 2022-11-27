//
//  ShowUserTesting.swift
//  LiSIGN
//
//  Created by Lenka Orinčáková on 11/22/22.
//

//
//  CardDetailed.swift
//  LiSIGN
//
//  Created by Lenka Orinčáková on 10/25/22.
//

import Foundation
import SwiftUI


struct ShowUserTesting: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var loginData: LoginPageModel = LoginPageModel()
    let defaults = UserDefaults.standard
    

    var body: some View {
        
        ZStack {
            Color("Bg")
            ScrollView  {
                //            Product Image
                
                    Image("chair_1")
                        .resizable()
                        .aspectRatio(1,contentMode: .fit)
                        .edgesIgnoringSafeArea(.top)
                
                DescriptionView()
                
            }
            .edgesIgnoringSafeArea(.top)
            
            HStack {
                Text("")
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
                
                Text("Add to Cart")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Primary"))
                    .padding()
                    .padding(.horizontal, 8)
                    .background(Color.white)
                    .cornerRadius(10.0)
                
            }
            .padding()
            .padding(.horizontal)
            .background(Color("Primary"))
            .cornerRadius(60.0, corners: .topLeft)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image("threeDot"))
    }
}







