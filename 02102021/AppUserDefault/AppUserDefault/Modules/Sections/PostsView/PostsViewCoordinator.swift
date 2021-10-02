//
//  PostsViewCoordinator.swift
//  AppUserDefault
//
//  Created by Andres Felipe Ocampo Eljaiek on 2/10/21.
//

import Foundation
import UIKit

final class PostsViewCoordinator {
    
    static func navigation() -> UINavigationController {
        UINavigationController(rootViewController: viewController())
    }
    
    static func viewController() -> UIViewController {
        PostsViewController()
    }
}
