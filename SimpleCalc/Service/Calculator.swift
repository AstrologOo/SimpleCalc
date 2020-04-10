//
//  Calculator.swift
//  SimpleCalc
//
//  Created by Alexsandr Ostrovsky on 4/10/20.
//  Copyright © 2020 Alexsandr Ostrovsky. All rights reserved.
//

import Foundation

enum CalculateMethod {
    case plus
    case minus
    case multiply
    case divide
}

class Calculator {
    private(set) var result: Double = 0
    private var lastOperation: CalculateMethod? = nil
    
    func operation(method: CalculateMethod, with number: Double) {
        if let operation = lastOperation {
            switch operation {
            case .plus:
                print("\(result) + \(number) = \(result + number)")
                result += number
            case .minus:
                print("\(result) - \(number) = \(result - number)")
                result -= number
            case .multiply:
                print("\(result) * \(number) = \(result * number)")
                result *= number
            case .divide:
                print("\(result) / \(number) = \(result / number)")
                result /= number
            }
        } else {
            result = number
            print("result: \(result)")
        }
                
        lastOperation = method
        print("wait for: \(method)")
    }
    
    func equal(with number: Double) {
        if let method = lastOperation {
            operation(method: method, with: number)
            lastOperation = nil
        }
    }
}
