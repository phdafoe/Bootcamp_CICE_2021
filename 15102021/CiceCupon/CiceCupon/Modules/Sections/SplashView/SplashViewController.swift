//
//  SplashViewController.swift
//  CiceCupon
//
//  Created by Andres Felipe Ocampo Eljaiek on 15/10/21.
//

import UIKit

protocol SplashViewControllerProtocol {
    func refreshView()
}

class SplashViewController: BaseView<SplashPresenterInputProtocol> {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.fetchData()
        // Do any additional setup after loading the view.
    }

}

extension SplashViewController: SplashViewControllerProtocol {
    
    func refreshView() {
        let aux = self.presenter?.getInformationObject()
        debugPrint(aux!)
    }
    
}
