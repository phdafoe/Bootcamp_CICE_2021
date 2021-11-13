//
//  DetailMovieViewModel.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 13/11/21.
//

import Foundation

// Output - Interactor
protocol DetailMovieInteractorOutputProtocol: BaseInteractorOutputProtocol{
    
}

final class DetailMovieViewModel: BaseViewModel, ObservableObject {
    
    var interactor: DetailMovieInteractorInputProtocol? {
        super.baseInteractor as? DetailMovieInteractorInputProtocol
    }
}

// extension Output - Interactor
extension DetailMovieViewModel: DetailMovieInteractorOutputProtocol {
    
}
