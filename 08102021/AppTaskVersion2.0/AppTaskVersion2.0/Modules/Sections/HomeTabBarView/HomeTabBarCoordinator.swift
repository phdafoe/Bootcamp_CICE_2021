//
//  HomeTabBarCoordinator.swift
//  AppTaskVersion2.0
//
//  Created by Andres Felipe Ocampo Eljaiek on 8/10/21.
//

import Foundation
import UIKit

final class HomeTabBarCoordinator {
    
    static func viewController() -> UITabBarController {
        
        let homeTBVC = HomeTabBarViewController()
        
        // View Controller con el Coordinator
        let contactosVC = ContactosViewCoordinator.navigation()
        let nuevaTareaVC = NuevaTareaCoordinator.navigation()
        let listaTareasVC = ListaTareasCoordinator.navigation()
        
        // Iconos
        let contactosItem = UITabBarItem(title: "Contactos",
                                         image: UIImage(systemName: "person.3"),
                                         selectedImage: UIImage(systemName: "person.3.fill"))
        
        let nuevaTareaItem = UITabBarItem(title: "Nueva Tarea",
                                         image: UIImage(systemName: "scribble"),
                                         selectedImage: UIImage(systemName: "scribble"))
        
        let listaTareasItem = UITabBarItem(title: "Lista Tareas",
                                         image: UIImage(systemName: "slider.horizontal.3"),
                                         selectedImage: UIImage(systemName: "slider.horizontal.3"))
        
        // Asignamos el icono al controlador de la vista que se quiere
        contactosVC.tabBarItem = contactosItem
        nuevaTareaVC.tabBarItem = nuevaTareaItem
        listaTareasVC.tabBarItem = listaTareasItem
        
        // Rellenamos el array de Controladores
        homeTBVC.viewControllers = [contactosVC, nuevaTareaVC, listaTareasVC]
        
        return homeTBVC
    }
    
}

