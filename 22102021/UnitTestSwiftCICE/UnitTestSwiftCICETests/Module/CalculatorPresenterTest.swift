//
//  CalculatorPresenterTest.swift
//  UnitTestSwiftCICE
//
//  Created by Andres Felipe Ocampo Eljaiek on 22/10/21.
//

/*
 func sumar(numero1: Int, numero2: Int) -> Int
 func restar(numero1: Int, numero2: Int) -> Int
 
 metodos a probar           Entrada         Salida
 
 sumar(int a, int b) ->    (a= 10, b = 20)  30
 sumar(int a, int b) ->    (a= 7, b = 4)    11
 restar(int a, int b) ->    (a= 7, b = 4)   3
 restar(int a, int b) ->    (a= 10, b = 20) -10
 
 
 BDD -> GIVEN - WHEN - THEN
 TDD
 
 Test Patron | Arrange ->
 test_NombreMetodo_EstadoTestear_ComportamientoEsperado
 
 
 Test Patron | BDD -> 
 test_PreconditionGiven_EstadoTestearWhen_ComportamientoEsperadoThen_BDD
 
 
 */

import XCTest
@testable import UnitTestSwiftCICE

class CalculatorPresenterTest: XCTestCase {
    
    var calculatorPresenter: CalculatorPresenter!

    override func setUp()  {
        print("YYY setUp")
        calculatorPresenter = CalculatorPresenter()
    }

    override func tearDown() {
        print("YYY tearDown")
        calculatorPresenter = nil
    }
    
    func test_Calculator_Not_Nil() {
        print("YYY test_Calculator_Not_Nil")
        XCTAssertNotNil(calculatorPresenter)
        XCTAssertEqual(calculatorPresenter.sumar(numero1: 10, numero2: 20), 30)
    }
    
    func test_Sumar_InputCorrect_One_OKResult_BDD() {
        print("YYY test_Sumar_InputCorrect_One_OKResult")
        // 1. GIVEN -> Variables de trabajo interno
        let resultadoEsperado = 30
        var resultadoActual: Int
        // 2. WHEN -> Asignacion de valores
        resultadoActual = calculatorPresenter.sumar(numero1: 10, numero2: 20)
        // 3. THEN -> Afirmacion del test
        XCTAssertEqual(resultadoActual, resultadoEsperado)
    }
    
    func test_Sumar_InputCorrect_Two_OKResult() {
        print("YYY test_Sumar_InputCorrect_Two_OKResult")
        // 1. Arrange -> Variables de trabajo interno
        let resultadoEsperado = 11
        var resultadoActual: Int
        // 2. Action -> Asignacion de valores
        resultadoActual = calculatorPresenter.sumar(numero1: 7, numero2: 4)
        // 3. Assert -> Afirmacion del test
        XCTAssertEqual(resultadoActual, resultadoEsperado)
    }
    
    func test_Restar_InputCorrect_One_OKResult() {
        print("YYY test_Restar_InputCorrect_One_OKResult")
        // 1. Arrange -> Variables de trabajo interno
        let resultadoEsperado = 3
        var resultadoActual: Int
        // 2. Action -> Asignacion de valores
        resultadoActual = calculatorPresenter.restar(numero1: 7, numero2: 4)
        // 3. Assert -> Afirmacion del test
        XCTAssertEqual(resultadoActual, resultadoEsperado)
    }
    
    func test_Restar_InputCorrect_Two_OKResult() {
        print("YYY test_Restar_InputCorrect_Two_OKResult")
        // 1. Arrange -> Variables de trabajo interno
        let resultadoEsperado = -10
        var resultadoActual: Int
        // 2. Action -> Asignacion de valores
        resultadoActual = calculatorPresenter.restar(numero1: 10, numero2: 20)
        // 3. Assert -> Afirmacion del test
        XCTAssertEqual(resultadoActual, resultadoEsperado)
    }
    
    func test_Dividir_InputCorrect_One_OKResult() {
        print("YYY test_Dividir_InputCorrect_One_OKResult")
        // 1. Arrange -> Variables de trabajo interno
        let resultadoEsperado = 2
        var resultadoActual: Int
        // 2. Action -> Asignacion de valores
        resultadoActual = calculatorPresenter.dividir(numero1: 4, numero2: 2)
        // 3. Assert -> Afirmacion del test
        XCTAssertEqual(resultadoActual, resultadoEsperado)
    }
    
    func test_Dividir_Zero() {
        print("YYY test_Dividir_Zero")
        XCTAssertEqual(try calculatorPresenter.dividirByZero(numero1: 4, numero2: 2), 2)
        XCTAssertThrowsError(try calculatorPresenter.dividirByZero(numero1: 4, numero2: 0))
    }
    
    // MARK: - Test methods
    func test_Assert_Types() {
        print("YYY test_Assert_Types")
        XCTAssertTrue(1 == 1)
        XCTAssertFalse(1 == 2)
        XCTAssertNil(nil)
        XCTAssertNotNil(calculatorPresenter)
        XCTAssertEqual(calculatorPresenter.dividir(numero1: 4, numero2: 2), 2)
        XCTAssertEqual("Andres", "Andres")
        XCTAssertGreaterThan(10, 1)
    }


}
