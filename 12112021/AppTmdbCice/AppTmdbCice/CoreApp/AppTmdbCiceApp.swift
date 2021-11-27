//
//  AppTmdbCiceApp.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/11/21.
//

import SwiftUI
import Firebase

@main
struct AppTmdbCiceApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(LoginViewModel())
        }
    }
}

final class AppDelegate:NSObject, UIApplicationDelegate {
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
