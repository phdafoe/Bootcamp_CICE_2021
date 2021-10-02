//
//  AppDelegate.swift
//  AppUserDefault
//
//  Created by Andres Felipe Ocampo Eljaiek on 2/10/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    let appCoordinator: AppCoreCoordinatorProtocol = AppCoreCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        if let windowDes = window {
            appCoordinator.initialApplication(whit: windowDes)
        }
        return true
    }

}

