//
//  Created on 20/11/21.
// DetailShow.swift - Very brief description
//

import Foundation
import SwiftUI

final class DetailShowCoordinator: BaseCoordinator {
    
    typealias ContentView = DetailShowView
    typealias ViewModel = DetailShowViewModel
    typealias Interactor = DetailShowInteractor
    typealias Provider = DetailShowProvider
    
    static func navigation(dto: DetailShowCoordinatorDTO? = nil) -> NavigationView<ContentView> {
        NavigationView {
            self.view()
        }
    }
    
    static func view(dto: DetailShowCoordinatorDTO? = nil) -> ContentView {
        let vip = BaseCoordinator.coordinator(viewModel: ViewModel.self,
                                              interactor: Interactor.self,
                                              provider: Provider.self)
        vip.provider.showObject = dto?.showObject ?? MoviesShowsModel(id: 0,
                                                                      backdropPath: "",
                                                                      posterPath: "",
                                                                      name: "")
        let view = ContentView(viewModel: vip.viewModel)
        return view
    }
}

struct DetailShowCoordinatorDTO {
    var showObject: MoviesShowsModel
}

