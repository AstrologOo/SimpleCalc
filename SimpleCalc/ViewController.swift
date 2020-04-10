//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Alexsandr Ostrovsky on 4/10/20.
//  Copyright © 2020 Alexsandr Ostrovsky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var equlBatton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet var numbersButtons: [UIButton]!
    @IBOutlet weak var clearButton: UIButton!
    
    private var model: ViewModel = ViewModel()
    
    private var needUpdateText = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = model.displayValue
        
        numbersButtons.forEach { $0.addTarget(self, action: #selector(self.numberButtonAction(_:)), for: .touchUpInside) }
    }

    @IBAction func plusButtonAction(_ sender: UIButton) {
        resultLabel.text = model.calc(with: .plus, number: resultLabel.text!)
    }
    
    @IBAction func equalButtonAction(_ sender: UIButton) {
        resultLabel.text = model.equal(number: resultLabel.text!)
    }
    
    @IBAction func minusButtonAction(_ sender: UIButton) {
        resultLabel.text = model.calc(with: .minus, number: resultLabel.text!)
    }
    
    @IBAction func multiplyButtonAction(_ sender: UIButton) {
        resultLabel.text = model.calc(with: .multiply, number: resultLabel.text!)
    }
    
    @IBAction func divideButtonAction(_ sender: UIButton) {
        resultLabel.text = model.calc(with: .divide, number: resultLabel.text!)
    }
    
    @objc private func numberButtonAction(_ sender: UIButton) {
        resultLabel.text = model.addSymbol(symbol: sender.titleLabel!.text!)
    }
    
    @IBAction func clearButtonAction(_ sender: UIButton) {
        resultLabel.text = model.removeSymbol()
    }
}

