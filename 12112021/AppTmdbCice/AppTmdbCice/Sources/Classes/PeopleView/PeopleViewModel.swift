//
//  Created on 3/12/21.
// People.swift - Very brief description
//


import Foundation

// Mark: - Output -> Interactor
protocol PeopleInteractorOutputProtocol: BaseInteractorOutputProtocol {
    
}

final class PeopleViewModel: BaseViewModel, ObservableObject {

    // MARK: VIP Dependencies
    var interactor: PeopleInteractorInputProtocol? {
        super.baseInteractor as? PeopleInteractorInputProtocol
    }
    
}

// Mark: - extension Output ->  Interactor
extension PeopleViewModel: PeopleInteractorOutputProtocol {

}
