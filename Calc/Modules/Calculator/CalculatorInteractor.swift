//
//  CalculatorInteractor.swift
//  Calc
//
//  Created by Jaume Ollés on 29/05/2017.
//  Copyright © 2017 Zinio. All rights reserved.
//

import Foundation
import Viperit

final class CalculatorInteractor: Interactor {
    
    func calculateResult(_ display: String) {
        
        var currentDisplay = "0" + display
        
        var result: Float?
        
        var operands: Array = currentDisplay.components(separatedBy: KeyboardKey.operandsCharacterSet())
        
        guard operands.count > 0 else {
            return
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
                            //Throw exception: Unknown operator
                            result = nil
                            break
                        }
                    }
                } else {
                    //Check what happens here
                    result = nil
                    break
                }
            } else {
                //Throw exception: Cannot convert String to Float
                result = nil
                break
            }
        }
        
        presenter.resultOfOperation(result: result)
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension CalculatorInteractor {
    var presenter: CalculatorPresenter {
        return _presenter as! CalculatorPresenter
    }
}
