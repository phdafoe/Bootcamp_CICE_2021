//
//  Created on 3/12/21.
// ShowsFavorite.swift - Very brief description
//


import Foundation
import Combine

// Mark: - Input Provider
protocol ShowsFavoriteProviderInputProtocol: BaseProviderInputProtocol {
    
}

final class ShowsFavoriteProvider: BaseProvider {

    // MARK: - VIP Dependences
    weak var interactor: ShowsFavoriteProviderOutputProtocol? {
        super.baseInteractor as? ShowsFavoriteProviderOutputProtocol
    }
    
    let networkService: NetworkServiceProtocol = NetworkService()
    var cancellable: Set<AnyCancellable> = []
    
}

// Mark: - extension -> Input Provider
extension ShowsFavoriteProvider: ShowsFavoriteProviderInputProtocol {
    
}


