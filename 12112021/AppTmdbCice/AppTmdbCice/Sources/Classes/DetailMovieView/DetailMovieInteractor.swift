//
//  DetailMovieInteractor.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 13/11/21.
//

import Foundation

// Input
protocol DetailMovieInteractorInputProtocol: BaseInteractorInputProtocol {
    
}

// Ouput - Provider
protocol DetailMovieProviderOutputProtocol: BaseProviderOutputProtocol {
    
}

final class DetailMovieInteractor: BaseInteractor {
    weak var viewModel: DetailMovieInteractorOutputProtocol? {
        super.baseViewModel as? DetailMovieInteractorOutputProtocol
    }
    var provider: DetailMovieProviderInputProtocol? {
        super.baseProvider as? DetailMovieProviderInputProtocol
    }
}

// extension Input
extension DetailMovieInteractor: DetailMovieInteractorInputProtocol {
    
}

// extension Output - Provider
extension DetailMovieInteractor: DetailMovieProviderOutputProtocol{
    
}
