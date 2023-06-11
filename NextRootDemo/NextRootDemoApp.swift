//
//  NextRootDemoApp.swift
//  NextRootDemo
//
//  Created by Md Abdul Gafur on 10/6/23.
//

import SwiftUI
import FirebaseCore

@main
struct NextRootDemoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            UserLoginView()
        }
    }
}

class AppDelegate : NSObject , UIApplicationDelegate {
    func application(_ application: UIApplication,didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        FirebaseApp.configure()

        return true

      }

    
}
