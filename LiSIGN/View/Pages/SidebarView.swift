//
//  SidebarView.swift
//  LiSIGN
//
//  Created by Lenka Orinčáková on 12/3/22.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct SidebarView: View {
    var viewModel: LoginPageModel
    
    @State private var navigateToStart =  false

    
    var body: some View {
        VStack (alignment: .trailing){
         
            //if we want something else in the profile, we can put it here
            
            ForEach(SidebarViewModel.allCases, id:\.rawValue) { value in
              
                HStack{
                   
                    NavigationLink(isActive: $navigateToStart)
                    {
                        OnBoardingPage()
                    }
                label: {
                    
                    Button {
                        viewModel.Logout()
                        navigateToStart = true
                    }
                label: {
                    Label("logout", systemImage: value.imageName)
                        .labelStyle(.iconOnly)
                }
               
                }
                    Text(value.name)
                    Spacer()
                   
                    
                }.frame(height:700)
                    .padding(.horizontal)
                    .padding(.bottom)
               
            }
            
        }
    }
}
struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView(viewModel: LoginPageModel())
    }
}
