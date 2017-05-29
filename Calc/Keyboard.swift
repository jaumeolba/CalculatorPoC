//
//  Keyboard.swift
//  Calc
//
//  Created by Jaume Ollés on 29/05/2017.
//  Copyright © 2017 Zinio. All rights reserved.
//

import UIKit

protocol KeyboardDelegate {
    func numberClicked(_ number: Int)
    func decimalClicked()
    func operationClicked(operation: Operation)
    func equalsClicked()
}

protocol Operation {
    var symbol: String { get }
    func calculate(_ firstOperand: Float,_ secondOperand: Float) -> Float
}

class Addition: Operation {
    
    let symbol: String = "+"
    
    func calculate(_ firstOperand: Float,_ secondOperand: Float) -> Float {
        return firstOperand + secondOperand
    }
}

class Substraction: Operation {
    
    let symbol: String = "-"
    
    func calculate(_ firstOperand: Float,_ secondOperand: Float) -> Float {
        return firstOperand - secondOperand
    }
}

class Keyboard: UIView {
    
    var delegate: KeyboardDelegate?
    
    @IBAction func number1Clicked(_ sender: Any) {
        delegate?.numberClicked(1)
    }
    
    @IBAction func number2Clicked(_ sender: Any) {
        delegate?.numberClicked(2)
    }
    
    @IBAction func number3Clicked(_ sender: Any) {
        delegate?.numberClicked(3)
    }
    
    @IBAction func number4Clicked(_ sender: Any) {
        delegate?.numberClicked(4)
    }
    
    @IBAction func number5Clicked(_ sender: Any) {
        delegate?.numberClicked(5)
    }
    
    @IBAction func number6Clicked(_ sender: Any) {
        delegate?.numberClicked(6)
    }
    
    @IBAction func number7Clicked(_ sender: Any) {
        delegate?.numberClicked(7)
    }
    
    @IBAction func number8Clicked(_ sender: Any) {
        delegate?.numberClicked(8)
    }
    
    @IBAction func number9Clicked(_ sender: Any) {
        delegate?.numberClicked(9)
    }
    
    @IBAction func number0Clicked(_ sender: Any) {
        delegate?.numberClicked(0)
    }
    
    @IBAction func decimalClicked(_ sender: Any) {
        delegate?.decimalClicked()
    }
    
    @IBAction func additionClicked(_ sender: Any) {
        delegate?.operationClicked(operation: Addition())
    }
    
    @IBAction func substractionClicked(_ sender: Any) {
        delegate?.operationClicked(operation: Substraction())
    }
    
    @IBAction func equalsClicked(_ sender: Any) {
        delegate?.equalsClicked()
    }
}
