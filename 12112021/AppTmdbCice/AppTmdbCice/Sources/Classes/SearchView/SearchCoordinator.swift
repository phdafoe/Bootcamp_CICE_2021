//
//  Created on 3/12/21.
// Search.swift - Very brief description
//

import Foundation
import SwiftUI

final class SearchCoordinator: BaseCoordinator {
    
    typealias ContentView = SearchView
    typealias ViewModel = SearchViewModel
    typealias Interactor = SearchInteractor
    typealias Provider = SearchProvider
    
    static func navigation(dto: SearchCoordinatorDTO? = nil) -> NavigationView<ContentView> {
        NavigationView {
            self.view()
        }
    }
    
    static func view(dto: SearchCoordinatorDTO? = nil) -> ContentView {
        let vip = BaseCoordinator.coordinator(viewModel: ViewModel.self,
                                              interactor: Interactor.self,
                                              provider: Provider.self)
        let view = ContentView(viewModel: vip.viewModel)
        return view
    }
}

struct SearchCoordinatorDTO {
    
}

