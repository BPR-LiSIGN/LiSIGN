//
//  LiSIGNApp.swift
//  LiSIGN
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
    
@main
struct LiSIGNApp: App {
    //follow the lifecycle of the app
    @StateObject var productsViewModel = ProductsViewModel()
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
                    .environmentObject(productsViewModel)
            }
        }
    }
}
