//
//  ViewModel.swift
//  SimpleCalc
//
//  Created by Alexsandr Ostrovsky on 4/10/20.
//  Copyright © 2020 Alexsandr Ostrovsky. All rights reserved.
//

import Foundation

class ViewModel {
    
    private var calculator: Calculator
    
    private var calculatorValue: String {
        get {
            return calculator.result.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", calculator.result) : String(calculator.result)
        }
    }
    
    private var screenText: String = "0"
    private var needUpdateText = true
    
    var displayValue: String {
        get {
            var text = screenText
            
            if let number = Double(text) {
                let formatter = NumberFormatter()
                formatter.decimalSeparator = "."
                formatter.groupingSeparator = " "
                formatter.numberStyle = .decimal
                if text.contains(".") {
                    if let range = text.range(of: ".") {
                        let count = text[range.upperBound...].count
                        formatter.minimumFractionDigits = count == 0 ? 1 : count
                    }
                }
                
                if let result = formatter.string(from: NSNumber(value: number)) {
                    text = result
                }
            }
            
            return text
        }
    }
    
    init() {
        self.calculator = Calculator()
    }
    
    @discardableResult
    func calc(with method: CalculateMethod, number: String) -> String {
        
        guard let number = Double(number) else {
            return displayValue
        }
        
        calculator.operation(method: method, with: number)
        screenText = calculatorValue
        needUpdateText = true
        return displayValue
    }
    
    @discardableResult
    func equal(number: String) -> String {
        guard let number = Double(number) else {
            return displayValue
        }
        
        calculator.equal(with: number)
        screenText = calculatorValue
        needUpdateText = true
        return displayValue
    }
    
    @discardableResult
    func addSymbol(symbol: String) -> String {
        
        if Int(symbol) == nil && screenText.contains(symbol) {
            return displayValue
        }
        
        if needUpdateText {
            screenText = symbol
        } else {
            screenText = screenText + symbol
        }
        
        needUpdateText = false
        return displayValue
    }
    
    @discardableResult
    func addSymbol(symbol: Int) -> String {
        addSymbol(symbol: String(symbol))
    }

    @discardableResult
    func removeSymbol() -> String {
        if needUpdateText {
            screenText = "0"
        } else {
            if screenText.count > 1 {
                screenText.removeLast()
            } else {
                screenText = "0"
                needUpdateText = true
            }
        }
        
        return displayValue
    }
    
}
