//
//  Created on 3/12/21.
// ShowsFavorite.swift - Very brief description
//

import Foundation
import SwiftUI

final class ShowsFavoriteCoordinator: BaseCoordinator {
    
    typealias ContentView = ShowsFavoriteView
    typealias ViewModel = ShowsFavoriteViewModel
    typealias Interactor = ShowsFavoriteInteractor
    typealias Provider = ShowsFavoriteProvider
    
    static func navigation(dto: ShowsFavoriteCoordinatorDTO? = nil) -> NavigationView<ContentView> {
        NavigationView {
            self.view()
        }
    }
    
    static func view(dto: ShowsFavoriteCoordinatorDTO? = nil) -> ContentView {
        let vip = BaseCoordinator.coordinator(viewModel: ViewModel.self,
                                              interactor: Interactor.self,
                                              provider: Provider.self)
        let view = ContentView(viewModel: vip.viewModel)
        return view
    }
}

struct ShowsFavoriteCoordinatorDTO {
    
}

