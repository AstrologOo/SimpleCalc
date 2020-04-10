//
//  SimpleCalc_ViewModerTests.swift
//  SimpleCalcTests
//
//  Created by Alexsandr Ostrovsky on 4/10/20.
//  Copyright © 2020 Alexsandr Ostrovsky. All rights reserved.
//

import XCTest
@testable import SimpleCalc

class SimpleCalc_ViewModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testResultString() {
        let model = ViewModel()
        
        model.calc(with: .plus, number: "10")
        model.equal(number: "10")
        
        XCTAssert(model.displayValue == "20")
        
        model.calc(with: .plus, number: "10.")
        model.equal(number: "10")
        
        XCTAssert(model.displayValue == "20")
        
        model.calc(with: .plus, number: "10.0")
        model.equal(number: "10")
        
        XCTAssert(model.displayValue == "20")
        
        model.calc(with: .plus, number: "10.0")
        model.equal(number: "10.0")
        
        XCTAssert(model.displayValue == "20")
        
        model.calc(with: .plus, number: "10.32")
        model.equal(number: "10")
        
        XCTAssert(model.displayValue == "20.32")
        
        model.calc(with: .plus, number: "10000")
        model.equal(number: "10")
        
        XCTAssert(model.displayValue == "10 010")
        
        model.calc(with: .plus, number: "!90#")
        model.equal(number: "$$$$")
        
        XCTAssert(model.displayValue == "10 010")
    }


}
