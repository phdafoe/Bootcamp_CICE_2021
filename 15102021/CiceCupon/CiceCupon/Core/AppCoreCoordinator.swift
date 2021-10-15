//
//  AppCoreCoordinator.swift
//  CiceCupon
//
//  Created by Andres Felipe Ocampo Eljaiek on 15/10/21.
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
    
    func initialViewController(in window: UIWindow) {
        self.actualVC = SplashCoordinator.view()
        window.rootViewController = self.actualVC
        window.makeKeyAndVisible()
    }
    
    
}
