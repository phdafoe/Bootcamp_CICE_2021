//
//  DetalleContactoCoordinator.swift
//  AppTaskVersion2.0
//
//  Created by Andres Felipe Ocampo Eljaiek on 8/10/21.
//

import Foundation
import UIKit

final class DetalleContactoCoordinator {
    
    static func viewController(dvo: ArrayContact? = nil) -> UIViewController {
        let vc = DetalleContactoViewController()
        vc.dataDetail = dvo
        return vc
    }
}
