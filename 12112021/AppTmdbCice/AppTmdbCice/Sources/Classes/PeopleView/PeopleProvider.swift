//
//  Created on 3/12/21.
// People.swift - Very brief description
//


import Foundation
import Combine

// Mark: - Input Provider
protocol PeopleProviderInputProtocol: BaseProviderInputProtocol {
    
}

final class PeopleProvider: BaseProvider {

    // MARK: - VIP Dependences
    weak var interactor: PeopleProviderOutputProtocol? {
        super.baseInteractor as? PeopleProviderOutputProtocol
    }
    
    let networkService: NetworkServiceProtocol = NetworkService()
    var cancellable: Set<AnyCancellable> = []
    
}

// Mark: - extension -> Input Provider
extension PeopleProvider: PeopleProviderInputProtocol {
    
}


