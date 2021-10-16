//
//  SplashRouter.swift
//  CiceCupon
//
//  Created by Andres Felipe Ocampo Eljaiek on 15/10/21.
//

import Foundation

protocol SplashRouterInputProtocol {
    func navigateToLoginView(with data: [ResultMusic])
}

final class SplashRouter: BaseRouter<SplashViewController> {
    
}

extension SplashRouter: SplashRouterInputProtocol {
    
    func navigateToLoginView(with data: [ResultMusic]) {
        DispatchQueue.main.async {
            if !Utils.Constantes().kPreferences.bool(forKey: Utils.Constantes().kUsuarioLogado) {
                let vc = LoginCoordinator.view(dto: LoginCoordinatorDTO(resultMusic: data))
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .fullScreen
                self.view?.present(vc, animated: true, completion: nil)
            } else {
                let vc = HomeTabBarCoordinator.tabBarCoordinator(dto: HomeTabBarCoordinatorDTO(arrayMusic: data))
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .fullScreen
                self.view?.present(vc, animated: true, completion: nil)
            }
        }
    }
    
    
}
