//
//  SplashInteractor.swift
//  CiceCupon
//
//  Created by Andres Felipe Ocampo Eljaiek on 15/10/21.
//

import Foundation

// entrada de las funciones que solicita Presenter
protocol SplashInteractorInputProtocol {
    func fetchDataMusic()
}

final class SplashInteractor: BaseInteractor<SplashInteractorOutputProtocol> {
    
    let provider: SplashProviderProtocol = SplashProvider()
    
}

// extension que aplica la ejecución del metodos que entran desde el Presenter
extension SplashInteractor: SplashInteractorInputProtocol{
    func fetchDataMusic() {
        self.provider.fetchData { data in
            switch data {
            case .success(let response):
                // Se invoca a la salida del interactor que van hacia el Presenter -> InteractorOutput
                self.presenter?.fetchDataOutputInteractor(data: response)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
