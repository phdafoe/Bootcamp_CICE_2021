//
//  CategoriaCoordinator.swift
//  AppTaskVersion2.0
//
//  Created by Andres Felipe Ocampo Eljaiek on 9/10/21.
//

import Foundation
import UIKit

final class CategoriaCoordinator {
    
    static func viewController(delegate: CategoriaViewControllerOutputDelegate) -> UIViewController {
        let vc = CategoriaViewController()
        vc.delegateOutput = delegate
        return vc
    }
    
}
