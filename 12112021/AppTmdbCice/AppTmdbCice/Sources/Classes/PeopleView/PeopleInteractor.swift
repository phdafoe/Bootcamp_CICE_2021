//
//  Created on 3/12/21.
// People.swift - Very brief description
//

import Foundation

// Mark: - Input Interactor
protocol PeopleInteractorInputProtocol: BaseInteractorInputProtocol {
    
}

// Mark: - Output -> Provider
protocol PeopleProviderOutputProtocol: BaseProviderOutputProtocol {
    
}

final class PeopleInteractor: BaseInteractor {

    // MARK: VIP Dependencies
    weak var viewModel: PeopleInteractorOutputProtocol? {
        super.baseViewModel as? PeopleInteractorOutputProtocol
    }
    var provider: PeopleProviderInputProtocol? {
        super.baseProvider as? PeopleProviderInputProtocol
    }

}

// Mark: - extension -> Input Interactor
extension PeopleInteractor: PeopleInteractorInputProtocol {

}

// Mark: - extension Output -> Provider
extension PeopleInteractor: PeopleProviderOutputProtocol{
    
}
