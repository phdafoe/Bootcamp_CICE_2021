//
//  NuevaTareaCoordinator.swift
//  AppTaskVersion2.0
//
//  Created by Andres Felipe Ocampo Eljaiek on 8/10/21.
//

import Foundation
import UIKit

final class NuevaTareaCoordinator {
    
    static func navigation() -> UINavigationController {
        let navVC = UINavigationController(rootViewController: viewController())
        navVC.navigationBar.setNavigationBarAppearance()
        return navVC
    }
    
    static func viewController() -> UIViewController {
        NuevaTareaViewController()
    }
    
}
