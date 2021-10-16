//
//  HomeTabBarCoordinator.swift
//  CiceCupon
//
//  Created by Andres Felipe Ocampo Eljaiek on 16/10/21.
//

import Foundation
import UIKit

final class HomeTabBarCoordinator {
    
    static func tabBarCoordinator(dto: HomeTabBarCoordinatorDTO? = nil) -> UITabBarController {
        
        let tabVC = HomeTabBarViewController()
        tabVC.aux = dto?.arrayMusic ?? []
        
        return tabVC
    }
}

struct HomeTabBarCoordinatorDTO {
    var arrayMusic: [ResultMusic]?
}
