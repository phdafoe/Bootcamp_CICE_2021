//
//  Created on 3/12/21.
// People.swift - Very brief description
//

import Foundation
import SwiftUI

final class PeopleCoordinator: BaseCoordinator {
    
    typealias ContentView = PeopleView
    typealias ViewModel = PeopleViewModel
    typealias Interactor = PeopleInteractor
    typealias Provider = PeopleProvider
    
    static func navigation(dto: PeopleCoordinatorDTO? = nil) -> NavigationView<ContentView> {
        NavigationView {
            self.view()
        }
    }
    
    static func view(dto: PeopleCoordinatorDTO? = nil) -> ContentView {
        let vip = BaseCoordinator.coordinator(viewModel: ViewModel.self,
                                              interactor: Interactor.self,
                                              provider: Provider.self)
        let view = ContentView(viewModel: vip.viewModel)
        return view
    }
}

struct PeopleCoordinatorDTO {
    
}

