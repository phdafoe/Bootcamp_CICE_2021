//
//  BaseVIPER.swift
//  CiceCupon
//
//  Created by Andres Felipe Ocampo Eljaiek on 15/10/21.
//

import Foundation
import UIKit

// MARK: - VIPER 1
class BaseView<P>: UIViewController {
    var presenter: P?
}

class BasePresenter<V, I, R> {
   
    var vc: V?
    var interactor: I?
    var router: R?
    
    convenience init(vc: V, interactor: I? = nil, router: R? = nil){
        self.init()
        self.vc = vc
        self.interactor = interactor
        self.router = router
    }
}

class BaseInteractor<P> {
    
    var presenter: P?
    
    convenience init(presenter: P) {
        self.init()
        self.presenter = presenter
    }
}

class BaseRouter<V> {
    
    var view: V?
    
    convenience init(view: V? = nil) {
        self.init()
        self.view = view
    }
}

class BaseNavigation: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
