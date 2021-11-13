//
//  ShowsCoordinator.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 13/11/21.
//

import Foundation
import SwiftUI

final class ShowsCoordinator: BaseCoordinator {
    
    typealias ContentView = ShowsView
    typealias ViewModel = ShowsViewModel
    typealias Interactor = ShowsInteractor
    typealias Provider = ShowsProvider
    
    static func navigation() -> NavigationView<ContentView> {
        NavigationView {
            self.view()
        }
    }
    
    static func view() -> ContentView {
        let vip = BaseCoordinator.coordinator(viewModel: ViewModel.self,
                                              interactor: Interactor.self,
                                              provider: Provider.self)
        let view = ContentView(viewModel: vip.viewModel)
        return view
    }
    
}
