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
    
    var body: some View {
        VStack (alignment: .trailing){
         
            //if we want something else in the profile, we can put it here
            
            ForEach(SidebarViewModel.allCases, id:\.rawValue) { value in
              
                HStack{
                    Button{ viewModel.Logout()
                        print("logged out")
                    }
                label: {
                    Image(systemName: value.imageName)

                
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
