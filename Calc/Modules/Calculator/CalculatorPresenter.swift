//
//  CalculatorPresenter.swift
//  Calc
//
//  Created by Jaume Ollés on 29/05/2017.
//  Copyright © 2017 Zinio. All rights reserved.
//

import Foundation
import Viperit

final class CalculatorPresenter: Presenter {
    
    internal func equalsPressed() {
        
    }
}


// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension CalculatorPresenter {
    var view: CalculatorViewInterface {
        return _view as! CalculatorViewInterface
    }
    var interactor: CalculatorInteractor {
        return _interactor as! CalculatorInteractor
    }
    var router: CalculatorRouter {
        return _router as! CalculatorRouter
    }
}

extension CalculatorPresenter: KeyboardDelegate {

    func keyClicked(key: KeyboardKey) {
        switch key {
        case .decimal:
            guard let currentDisplayValue = view.getCurrentDisplayValue() else {
                return
            }
            
            
            break
        case .addition:
            guard let currentDisplayValue =  view.getCurrentDisplayValue(), let lastCharacter = currentDisplayValue.characters.last, let lastChar = String(.init(lastCharacter)), let lastCharacterKey = KeyboardKey(rawValue: lastChar) else {
                return
            }
            if lastCharacterKey.isNumber() {
                view.appendToDisplay(key.rawValue)
            } else if lastCharacterKey.isOperand(), lastCharacterKey == .decimal {
                view.replaceLastCharacter(with: key.rawValue)
            }
            break
        case .substraction:
            guard let currentDisplayValue =  view.getCurrentDisplayValue() else {
                view.appendToDisplay(key.rawValue)
                return
            }
            guard let lastCharacter = currentDisplayValue.characters.last, let lastChar = String(.init(lastCharacter)), let lastCharacterKey = KeyboardKey(rawValue: lastChar) else {
                return
            }
            if lastCharacterKey.isNumber() {
                view.appendToDisplay(key.rawValue)
            } else if lastCharacterKey.isOperand(), lastCharacterKey == .decimal {
                view.replaceLastCharacter(with: key.rawValue)
            }
            break
        case .equals:
            break
        case .number0, .number1, .number2, .number3, .number4, .number5, .number6, .number7, .number8, .number9:
            view.appendToDisplay(key.rawValue)
            break
        }
    }
}
