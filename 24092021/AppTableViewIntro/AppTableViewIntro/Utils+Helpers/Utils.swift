//
//  Utils.swift
//  AppTableViewIntro
//
//  Created by Andres Felipe Ocampo Eljaiek on 24/9/21.
//

import Foundation
import UIKit

protocol ReuseIdentifierProtocol: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

extension ReuseIdentifierProtocol where Self: UIView {
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

protocol ReuseIdentifierViewControllerProtocol: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

extension ReuseIdentifierViewControllerProtocol where Self: UIViewController {
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}



