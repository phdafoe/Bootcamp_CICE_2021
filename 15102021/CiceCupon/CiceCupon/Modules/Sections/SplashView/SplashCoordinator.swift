//
//  SplashCoordinator.swift
//  CiceCupon
//
//  Created by Andres Felipe Ocampo Eljaiek on 15/10/21.
//

import Foundation

final class SplashCoordinator{
    
    static func navigation(dto: SplashCoordinatorDTO? = nil) -> BaseNavigation {
       BaseNavigation(rootViewController: view())
    }
    
    static func view(dto: SplashCoordinatorDTO? = nil) -> SplashViewController & SplashViewControllerProtocol {
        let vc = SplashViewController()
        vc.presenter = self.presenter(vc: vc)
        return vc
    }
    
    static func presenter(vc: SplashViewController) -> SplashPresenterInputProtocol & SplashInteractorOutputProtocol {
        let presenter = SplashPresenter(vc: vc)
        presenter.interactor = self.interactor(pre: presenter)
        presenter.router = self.router(vc: vc)
        return presenter
    }
    
    static func interactor(pre: SplashPresenter) -> SplashInteractorInputProtocol {
        let interactor = SplashInteractor(presenter: pre)
        return interactor
    }
    
    static func router(vc: SplashViewController) -> SplashRouterInputProtocol {
        let router = SplashRouter(view: vc)
        return router
    }
    
}

struct SplashCoordinatorDTO {
    
}
