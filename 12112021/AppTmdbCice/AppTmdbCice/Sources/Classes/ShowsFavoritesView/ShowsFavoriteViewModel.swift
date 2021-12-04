//
//  Created on 3/12/21.
// ShowsFavorite.swift - Very brief description
//


import Foundation

// Mark: - Output -> Interactor
protocol ShowsFavoriteInteractorOutputProtocol: BaseInteractorOutputProtocol {
    
}

final class ShowsFavoriteViewModel: BaseViewModel, ObservableObject {

    // MARK: VIP Dependencies
    var interactor: ShowsFavoriteInteractorInputProtocol? {
        super.baseInteractor as? ShowsFavoriteInteractorInputProtocol
    }
    
    func fetchDataDetailMovie() {
        self.interactor?.fetchDataDetailMovieFromFirebaseInteractor()
    }
    
}

// Mark: - extension Output ->  Interactor
extension ShowsFavoriteViewModel: ShowsFavoriteInteractorOutputProtocol {

}
