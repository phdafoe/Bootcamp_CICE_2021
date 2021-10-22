//
//  CalculatorPresenter.swift
//  UnitTestSwiftCICE
//
//  Created by Andres Felipe Ocampo Eljaiek on 22/10/21.
//

/*
 func sumar(numero1: Int, numero2: Int) -> Int
 func restar(numero1: Int, numero2: Int) -> Int
 func dividir(numero1: Int, numero2: Int) -> Int
 func dividirByZero(numero1: Int, numero2: Int) throws -> Int
 */

import Foundation

enum SomeError: Error {
    case ZeroError
}

final class CalculatorPresenter {
    
    func sumar(numero1: Int, numero2: Int) -> Int {
        return numero1 + numero2
    }
    
    func restar(numero1: Int, numero2: Int) -> Int {
        return numero1 - numero2
    }
    
    func dividir(numero1: Int, numero2: Int) -> Int {
        return numero1 / numero2
    }
    
    func dividirByZero(numero1: Int, numero2: Int) throws -> Int {
        if numero2 == 0 {
            throw SomeError.ZeroError
        }
        return numero1 / numero2
    }
    
}
