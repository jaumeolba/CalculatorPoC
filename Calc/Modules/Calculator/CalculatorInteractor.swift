//
//  CalculatorInteractor.swift
//  Calc
//
//  Created by Jaume Ollés on 29/05/2017.
//  Copyright © 2017 Zinio. All rights reserved.
//

import Foundation
import Viperit

class CalculatorInteractor: Interactor {
    
    func calculateResult(_ display: String) {
        presenter.resultOfOperation(result: calculate(display))
    }
    
    func calculateFinalResult(_ display: String) {
        presenter.finalResultOfOperation(result: calculate(display))
    }
    
    func calculate(_ display: String) -> Float? {
        let result = calculateResult(value: display, characterSet: KeyboardKey.operandsCharacterSet())
        return result
        
    }
    
    func calculateResult(value: String, characterSet: CharacterSet) -> Float? {
        var result: Float?
        var currentDisplay = "0" + value
        
        if let lastValueOp = CalcUtils.getLastCharacter(currentDisplay)?.isOperator(), lastValueOp {
            
            currentDisplay = currentDisplay.substring(to: currentDisplay.index(before: currentDisplay.endIndex))
        }
        
        var operands: Array = currentDisplay.components(separatedBy: KeyboardKey.operandsCharacterSet())
        
        guard operands.count > 0 else {
            return nil
        }
        
        while operands.count > 0 {
            var secondOperandString = operands[0]
            if  let secondOperand = Float(secondOperandString) {
                if let index = currentDisplay.range(of: secondOperandString) {
                    let value = currentDisplay.substring(to: index.lowerBound)
                    if value == "", result == nil {
                        result = secondOperand
                        currentDisplay = currentDisplay.substring(from: index.upperBound)
                        operands.remove(at: 0)
                    } else {
                        if let key = KeyboardKey(rawValue: value), key.isOperator(), let operatorFunc = key.getOperator() {
                            result = operatorFunc.calculate(firstOperand: result ?? 0.0, secondOperand: secondOperand)
                            currentDisplay = currentDisplay.substring(from: index.upperBound)
                            operands.remove(at: 0)
                        } else {
                            //Unknown operator
                            result = nil
                            break
                        }
                    }
                } else {
                    //Cannot find second operand? Something went wrong in the process
                    result = nil
                    break
                }
            } else {
                //Cannot convert String to Float
                result = nil
                break
            }
        }
        
        return result
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension CalculatorInteractor {
    var presenter: CalculatorPresenter {
        return _presenter as! CalculatorPresenter
    }
}
