//
//  UserDataCoordinator.swift
//  AppUserDefault
//
//  Created by Andres Felipe Ocampo Eljaiek on 2/10/21.
//

import Foundation
import UIKit

final class UserDataCoordinator{
    
    static func navigation() -> UINavigationController {
        UINavigationController(rootViewController: viewController())
    }
    
    static func viewController() -> UIViewController {
        UserDataViewController()
    }
    
}
