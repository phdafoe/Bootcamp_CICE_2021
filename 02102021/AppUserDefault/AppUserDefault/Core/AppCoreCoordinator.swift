//
//  AppCoreCoordinator.swift
//  AppUserDefault
//
//  Created by Andres Felipe Ocampo Eljaiek on 2/10/21.
//

import Foundation
import UIKit

protocol AppCoreCoordinatorProtocol{
    func initialApplication(whit window: UIWindow)
}

final class AppCoreCoordinator {
    
    var actualVC = UIViewController()
    
}

extension AppCoreCoordinator: AppCoreCoordinatorProtocol{
    
    func initialApplication(whit window: UIWindow) {
        self.muestraRutaUserdefault()
        
        if !Utils.Constantes().kPrefs.bool(forKey: Utils.Constantes().kUsuarioLogado) {
            self.actualVC = UserDataCoordinator.viewController()
        } else {
            self.actualVC = HomeTabBarCoordinator.homeTabBarVC()
        }
        
        window.rootViewController = self.actualVC
        window.makeKeyAndVisible()
    }
    
    private func muestraRutaUserdefault(){
        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
    }
    
    
}
