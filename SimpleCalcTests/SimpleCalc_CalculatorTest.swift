//
//  SimpleCalcTests.swift
//  SimpleCalcTests
//
//  Created by Alexsandr Ostrovsky on 4/10/20.
//  Copyright © 2020 Alexsandr Ostrovsky. All rights reserved.
//

import XCTest
@testable import SimpleCalc

class SimpleCalc_CalculatorTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPlus() {
        let calculator = Calculator()
        
        calculator.operation(method: .plus, with: 1)
        calculator.equal(with: 2)
        
        XCTAssert(calculator.result == 3, "Plus operation is error")
    }
    
    func testMinus() {
        let calculator = Calculator()
        
        calculator.operation(method: .minus, with: 4)
        calculator.equal(with: 2)
        
        XCTAssert(calculator.result == 2, "Minus operation is error")
    }
    
    func testMultiply() {
        let calculator = Calculator()
        
        calculator.operation(method: .multiply, with: 4)
        calculator.equal(with: 3)
        
        XCTAssert(calculator.result == 12, "Multiply operation is error")
        
        calculator.operation(method: .multiply, with: 10.5)
        calculator.equal(with: 700)
        
        XCTAssert(calculator.result == 7350, "Multiply operation is error")
    }
    
    func testDivide() {
        let calculator = Calculator()
        
        calculator.operation(method: .divide, with: 10)
        calculator.equal(with: 5)
        
        XCTAssert(calculator.result == 2, "Divide operation is error")
    }
    
    func testMultyOperation() {
        let calculator = Calculator()
        
        // 10 + 5 - 6 * 2 / 9 = 2
        
        calculator.operation(method: .plus, with: 10)
        calculator.operation(method: .minus, with: 5)
        calculator.operation(method: .multiply, with: 6)
        calculator.operation(method: .divide, with: 2)
        calculator.equal(with: 9)
        
        XCTAssert(calculator.result == 2, "Multy operations is error")
    }

}
