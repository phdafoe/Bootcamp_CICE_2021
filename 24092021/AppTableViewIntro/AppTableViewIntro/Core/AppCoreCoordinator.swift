//
//  AppCoreCoordinator.swift
//  AppTableViewIntro
//
//  Created by Andres Felipe Ocampo Eljaiek on 24/9/21.
//

import Foundation
import UIKit

protocol AppCoreCoordinatorProtocol {
    func setPrincipalViewController(in window: UIWindow)
}

final class AppCoreCoordinator {
    var actualViewController: UIViewController!
}

// MARK: - AppCoreCoordinator: AppCoreCoordinatorProtocol
extension AppCoreCoordinator: AppCoreCoordinatorProtocol {
    
    internal func setPrincipalViewController(in window: UIWindow) {
        actualViewController = HomeTabBarCoordinator.tabBarCoordinator()
        window.rootViewController = actualViewController
        window.makeKeyAndVisible()
    }
}
