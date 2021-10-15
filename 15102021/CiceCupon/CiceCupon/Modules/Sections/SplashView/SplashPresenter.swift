//
//  SplashPresenter.swift
//  CiceCupon
//
//  Created by Andres Felipe Ocampo Eljaiek on 15/10/21.
//

import Foundation

// entrada de las funciones que solicita el View Controller
protocol SplashPresenterInputProtocol {
    func fetchData()
    func getInformationObject() -> ResultMusic?
}

// Entrada de las funciones que vienen desde la salida del Interactor -> InteractorOutput
protocol SplashInteractorOutputProtocol {
    func fetchDataOutputInteractor(data: MusicServerModel?)
}

final class SplashPresenter: BasePresenter<SplashViewControllerProtocol, SplashInteractorInputProtocol, SplashRouterInputProtocol> {
    
    var arrayResultados: [ResultMusic] = []
}

// extension que aplica la ejecución del metodos que entran desde el View Controller
extension SplashPresenter: SplashPresenterInputProtocol {

    func fetchData() {
        self.interactor?.fetchDataMusic()
    }
    
    func getInformationObject() -> ResultMusic? {
        self.arrayResultados[0]
    }

}


// extension que añlica la ejecucion del metodo que entran desde el Interactor
extension SplashPresenter: SplashInteractorOutputProtocol {
    
    func fetchDataOutputInteractor(data: MusicServerModel?) {
        self.arrayResultados.removeAll()
        self.arrayResultados = data?.feed?.results ?? []
        self.vc?.refreshView()
    }
    
}
