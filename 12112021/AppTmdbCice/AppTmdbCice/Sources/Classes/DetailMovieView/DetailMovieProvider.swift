//
//  DetailMovieProvider.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 13/11/21.
//

import Foundation

// Input
protocol DetailMovieProviderInputProtocol: BaseProviderInputProtocol {
    
}

final class DetailMovieProvider: BaseProvider {
    
    weak var interactor: DetailMovieProviderOutputProtocol? {
        super.baseInteractor as? DetailMovieProviderOutputProtocol
    }
    
}

// extension Input
extension DetailMovieProvider: DetailMovieProviderInputProtocol {
    
}
