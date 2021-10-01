//
//  HomeTabBarCoordinator.swift
//  AppTableViewIntro
//
//  Created by Andres Felipe Ocampo Eljaiek on 25/9/21.
//

import Foundation
import UIKit

final class HomeTabBarCoordinator{
    
    static func tabBarCoordinator() -> UITabBarController {
        let tabBarVC = HomeTabBarViewController()
        
        // controladores
        let listaMesesVC = ListaMesesCoordinator.navigation()
        let listaCochesVC = ListaCochesCoordinator.navigation()
        let perfilVC = PerfilViewCoordinator.navigation()
        
        // Iconos de la Tab Bar quw corresponden a cada controlador
        let listaMesesItem = UITabBarItem(title: "Meses",
                                    image: UIImage(systemName: "house"),
                                    selectedImage: UIImage(systemName: "house"))
        
        let listaCochesItem = UITabBarItem(title: "Coches",
                                    image: UIImage(systemName: "house"),
                                    selectedImage: UIImage(systemName: "house"))
        
        let perfilItem = UITabBarItem(title: "Perfil",
                                    image: UIImage(systemName: "person.crop.circle"),
                                    selectedImage: UIImage(systemName: "person.crop.circle"))
        
        // asignas a cada controlador su icono
        listaMesesVC.tabBarItem = listaMesesItem
        listaCochesVC.tabBarItem = listaCochesItem
        perfilVC.tabBarItem = perfilItem
        
        // Le dices al Tab Bar que coloque un array de controladores
        tabBarVC.viewControllers = [listaMesesVC, listaCochesVC, perfilVC]
        
        return tabBarVC
    }
    
}
