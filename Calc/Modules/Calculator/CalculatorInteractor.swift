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
        
        var firstOperand: Float = 0.0
        var secondOperand: Float = 0.0
        
        var characterSet = CharacterSet()
        characterSet.insert(charactersIn: KeyboardKey.addition.rawValue)
        characterSet.insert(charactersIn: KeyboardKey.substraction.rawValue)
        
        let operands: Array = display.components(separatedBy: characterSet)
        
        guard operands.count > 0 else {
            return
        }
        
        while operands.count > 0 {
            
        }
        
        presenter.resultOfOperation(result: 54.0)
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension CalculatorInteractor {
    var presenter: CalculatorPresenter {
        return _presenter as! CalculatorPresenter
    }
}
