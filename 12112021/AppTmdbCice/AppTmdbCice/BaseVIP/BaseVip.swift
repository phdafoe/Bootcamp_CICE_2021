//
//  BaseVip.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/11/21.
//

import Foundation

protocol BaseInteractorInputProtocol: AnyObject {}
protocol BaseInteractorOutputProtocol: AnyObject {}
protocol BaseProviderInputProtocol: AnyObject {}
protocol BaseProviderOutputProtocol: AnyObject {}

class BaseViewModel {
    internal var baseInteractor: BaseInteractorInputProtocol?
    required init() {}
}

class BaseInteractor {
    internal weak var baseViewModel: BaseInteractorOutputProtocol?
    internal var baseProvider: BaseProviderInputProtocol?
    required init() {}
}

class BaseProvider {
    internal weak var baseInteractor: BaseProviderOutputProtocol?
    required init() {}
}

class BaseCoordinator {
    
    static func coordinator<ViewModel: BaseViewModel,
                            Interactor: BaseInteractor,
                            Provider: BaseProvider>(viewModel: ViewModel.Type,
                                                    interactor: Interactor.Type,
                                                    provider: Provider.Type) -> (viewModel: ViewModel,
                                                                                 interactor: Interactor,
                                                                                 provider: Provider) {
        
        let baseViewModel = ViewModel()
        let baseInteractor = Interactor()
        let baseProvider = Provider()
        
        baseViewModel.baseInteractor = baseInteractor as? BaseInteractorInputProtocol
        baseInteractor.baseViewModel = baseViewModel as? BaseInteractorOutputProtocol
        baseInteractor.baseProvider = baseProvider as? BaseProviderInputProtocol
        baseProvider.baseInteractor = baseInteractor as? BaseProviderOutputProtocol
        
        return (baseViewModel, baseInteractor, baseProvider)
        
    }
}
