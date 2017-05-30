//
//  Keyboard.swift
//  Calc
//
//  Created by Jaume Ollés on 29/05/2017.
//  Copyright © 2017 Zinio. All rights reserved.
//

import UIKit

enum KeyboardKey: String {
    case number1 = "1"
    case number2 = "2"
    case number3 = "3"
    case number4 = "4"
    case number5 = "5"
    case number6 = "6"
    case number7 = "7"
    case number8 = "8"
    case number9 = "9"
    case number0 = "0"
    case addition = "+"
    case substraction = "-"
    case decimal = "."
    case equals = "="
    
    func isNumber() -> Bool {
        return self == .number0 ||
        self == .number1 ||
        self == .number2 ||
        self == .number3 ||
        self == .number4 ||
        self == .number5 ||
        self == .number6 ||
        self == .number7 ||
        self == .number8 ||
        self == .number9
    }
    
    func isOperand() -> Bool {
        return self == .addition ||
        self == .substraction
    }
}

protocol KeyboardDelegate {
    func keyClicked(key: KeyboardKey)
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
    
    @IBAction func keyClicked(_ sender: Any) {
        guard let buttonText = (sender as? UIButton)?.titleLabel?.text,  let keyboardKey = KeyboardKey.init(rawValue: buttonText) else {
            return
        }
        delegate?.keyClicked(key: keyboardKey)
    }
}
