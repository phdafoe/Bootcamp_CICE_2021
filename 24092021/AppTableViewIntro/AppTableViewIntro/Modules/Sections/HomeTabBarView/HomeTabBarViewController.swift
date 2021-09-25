//
//  HomeTabBarViewController.swift
//  AppTableViewIntro
//
//  Created by Andres Felipe Ocampo Eljaiek on 25/9/21.
//

import UIKit

class HomeTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // controladores
        let listaMesesVC = ListaMesesCoordinator.navigation()
        let listaCochesVC = ListaCochesCoordinator.navigation()
        
        // Iconos de la Tab Bar quw corresponden a cada controlador
        let listaMesesItem = UITabBarItem(title: "Meses",
                                    image: UIImage(systemName: "house"),
                                    selectedImage: UIImage(systemName: "house"))
        
        let listaCochesItem = UITabBarItem(title: "Coches",
                                    image: UIImage(systemName: "house"),
                                    selectedImage: UIImage(systemName: "house"))
        
        // asignas a cada controlador su icono
        listaMesesVC.tabBarItem = listaMesesItem
        listaCochesVC.tabBarItem = listaCochesItem
        
        // Le dices al Tab Bar que coloque un array de controladores
        self.viewControllers = [listaMesesVC, listaCochesVC]
        
        //self.selectedIndex = 1
        
    }


}
