//
//  Created on 20/11/21.
// DetailShow.swift - Very brief description
//


import Foundation
import Combine

// Mark: - Input Provider
protocol DetailShowProviderInputProtocol: BaseProviderInputProtocol {
    
}

final class DetailShowProvider: BaseProvider {

    // MARK: - VIP Dependences
    weak var interactor: DetailShowProviderOutputProtocol? {
        super.baseInteractor as? DetailShowProviderOutputProtocol
    }
    
    let networkService: NetworkServiceProtocol = NetworkService()
    var cancellable: Set<AnyCancellable> = []
    
}

// Mark: - extension -> Input Provider
extension DetailShowProvider: DetailShowProviderInputProtocol {
    
}


