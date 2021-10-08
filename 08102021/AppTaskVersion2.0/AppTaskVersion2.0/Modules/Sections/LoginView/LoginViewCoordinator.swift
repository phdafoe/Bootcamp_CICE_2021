//
//  LoginViewCoordinator.swift
//  AppTaskVersion2.0
//
//  Created by Andres Felipe Ocampo Eljaiek on 8/10/21.
//

import Foundation
import UIKit

final class LoginViewCoordinator {
    
    static func navigation() -> UINavigationController {
        UINavigationController(rootViewController: viewController())
    }
    
    static func viewController() -> UIViewController {
        LoginViewController()
    }
    
}
