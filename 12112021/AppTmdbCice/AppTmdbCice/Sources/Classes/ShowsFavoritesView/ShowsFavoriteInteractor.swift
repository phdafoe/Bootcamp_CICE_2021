//
//  Created on 3/12/21.
// ShowsFavorite.swift - Very brief description
//

import Foundation

// Mark: - Input Interactor
protocol ShowsFavoriteInteractorInputProtocol: BaseInteractorInputProtocol {
    func fetchDataDetailMovieFromFirebaseInteractor()
}

// Mark: - Output -> Provider
protocol ShowsFavoriteProviderOutputProtocol: BaseProviderOutputProtocol {
    
}

final class ShowsFavoriteInteractor: BaseInteractor {

    // MARK: VIP Dependencies
    weak var viewModel: ShowsFavoriteInteractorOutputProtocol? {
        super.baseViewModel as? ShowsFavoriteInteractorOutputProtocol
    }
    var provider: ShowsFavoriteProviderInputProtocol? {
        super.baseProvider as? ShowsFavoriteProviderInputProtocol
    }

}

// Mark: - extension -> Input Interactor
extension ShowsFavoriteInteractor: ShowsFavoriteInteractorInputProtocol {

    func fetchDataDetailMovieFromFirebaseInteractor() {
        self.provider?.fetchDataDetailMovieFromFirebase()
    }
}

// Mark: - extension Output -> Provider
extension ShowsFavoriteInteractor: ShowsFavoriteProviderOutputProtocol{
    
}
