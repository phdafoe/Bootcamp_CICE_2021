//
//  ListaCochesCoordinator.swift
//  AppTableViewIntro
//
//  Created by Andres Felipe Ocampo Eljaiek on 25/9/21.
//

import Foundation
import UIKit

final class ListaCochesCoordinator {
    
    static func navigation() -> UINavigationController {
        UINavigationController.init(rootViewController: viewController())
    }
    
    static func viewController() -> UIViewController {
        ListaCochesViewController()
    }
}
