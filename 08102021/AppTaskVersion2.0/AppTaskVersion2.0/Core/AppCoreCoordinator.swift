//
//  AppCoreCoordinator.swift
//  AppTaskVersion2.0
//
//  Created by Andres Felipe Ocampo Eljaiek on 8/10/21.
//

import Foundation
import UIKit

protocol AppCoreCoordinatorProtocol {
    
    func initialViewController(in window: UIWindow)
    
}

final class AppCoreCoordinator {
    
    var actualVC = UIViewController()
    
}

extension AppCoreCoordinator: AppCoreCoordinatorProtocol {
    
    internal func initialViewController(in window: UIWindow) {
        
        self.localNotificationSetup()
        
        if Utils.Constantes().kPreferences.bool(forKey: Utils.Constantes().kUsuarioLogado) {
            self.actualVC = HomeTabBarCoordinator.viewController()
        } else {
            self.actualVC = LoginViewCoordinator.viewController()
        }

        window.rootViewController = self.actualVC
        window.makeKeyAndVisible()
    }
    
    private func localNotificationSetup() {
        // Solicitamos al usuario que necesitamos enviarle notificaciones
        if UIApplication.instancesRespond(to: #selector(UIApplication.registerUserNotificationSettings(_:))) {
            let setting = UIUserNotificationSettings(types: [.alert, .badge, .sound],
                                                     categories: nil)
            UIApplication.shared.registerUserNotificationSettings(setting)
        }
    }
}
