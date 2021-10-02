//
//  AppCoreCoordinator.swift
//  AppUserDefault
//
//  Created by Andres Felipe Ocampo Eljaiek on 2/10/21.
//

import Foundation
import UIKit

protocol AppCoreCoordinatorProtocol{
    func initialApplication(whit window: UIWindow)
}

final class AppCoreCoordinator {
    
    var actualVC = UIViewController()
    
}

extension AppCoreCoordinator: AppCoreCoordinatorProtocol{
    
    func initialApplication(whit window: UIWindow) {
        self.actualVC = UserDataCoordinator.navigation()
        window.rootViewController = self.actualVC
        window.makeKeyAndVisible()
    }
    
    
}
