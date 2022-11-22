//
//  Sidebar.swift
//  LiSIGN
//

import SwiftUI

struct Sidebar: View {
    var loginViewModel = LoginPageModel()
    @State var shouldShowLogOutOptions = false
    // @Binding var showSidebar: Bool
    var body: some View {
//        NavigationView {
//            List { // Let's keep this as a list in case we want to add something else
//                NavigationLink(destination: OnBoardingPage()) {
//                    Label("Sign out", systemImage:"gear")
//                }
//            }
//            .listStyle(SidebarListStyle())
//            .navigationTitle("Profile")
//            .frame(width: 300)
//        }
        HStack {
            Button {
                shouldShowLogOutOptions.toggle()
            } label: {
                Image(systemName: "gear")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color(.label))
            }
        }
        .padding()
        .actionSheet(isPresented: $shouldShowLogOutOptions) {
            .init(title: Text("Settings", message: Text("What do you want to do?"), buttons: [
                .destructive(Text("Sign Out"), action: {
                    print("handle sign out")
                    loginViewModel.Logout()
                }),
                .cancel()
            ]))
        }
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        // Sidebar($showSidebar)
        Sidebar()
    }
}
