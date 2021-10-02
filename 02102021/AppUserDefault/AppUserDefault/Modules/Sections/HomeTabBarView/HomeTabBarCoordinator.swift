//
//  HomeTabBarCoordinator.swift
//  AppUserDefault
//
//  Created by Andres Felipe Ocampo Eljaiek on 2/10/21.
//

import Foundation
import UIKit

final class HomeTabBarCoordinator{
    
    static func homeTabBarVC() -> UITabBarController{
        
        let homeTabVC = HomeTabBarViewController()
                
        let perfilVC = PerfilViewCoordinator.viewController()
        let mesesCochesVC = MeseCochesCoordinator.navigation()
        let postsVC = PostsViewCoordinator.navigation()
        
        let perfilItem = UITabBarItem(title: "Perfil",
                                      image: UIImage(systemName: "person.circle"),
                                      selectedImage: UIImage(systemName: "person.circle.fill"))
        
        let meseCochesItem = UITabBarItem(title: "Meses/Coches",
                                      image: UIImage(systemName: "person.circle"),
                                      selectedImage: UIImage(systemName: "person.circle.fill"))
        
        let postsItem = UITabBarItem(title: "Posts",
                                      image: UIImage(systemName: "square.and.pencil"),
                                      selectedImage: UIImage(systemName: "square.and.pencil"))
        

        perfilVC.tabBarItem = perfilItem
        mesesCochesVC.tabBarItem = meseCochesItem
        postsVC.tabBarItem = postsItem
        
        homeTabVC.viewControllers = [postsVC,mesesCochesVC,perfilVC]
        
        
        return homeTabVC
    }
    
}
