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
    
    internal var currentDisplayValue: String = ""

    
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
    
    internal func append(_ value: String) {
        currentDisplayValue.append(value)
    }
    
    internal func replaceLastCharacter(with value: String) {
        let lastIndex = currentDisplayValue.index(before: currentDisplayValue.endIndex)
        currentDisplayValue = currentDisplayValue.substring(to: lastIndex) + value
    }
    
    internal func getLastCharacter() -> KeyboardKey? {
        guard currentDisplayValue.characters.count > 0, let lastCharacter = currentDisplayValue.characters.last, let lastChar = String(.init(lastCharacter)), let lastCharacterKey = KeyboardKey(rawValue: lastChar) else {
            return nil
        }
        return lastCharacterKey
    }
    
    internal func getLastNumberBlock() -> String? {
        
        var characterSet = CharacterSet.init()
        characterSet.insert(charactersIn: KeyboardKey.addition.rawValue)
        characterSet.insert(charactersIn: KeyboardKey.substraction.rawValue)
        let components = currentDisplayValue.components(separatedBy: characterSet)
        guard components.count > 0 else {
            return nil
        }
        return components[components.count - 1]
    }

    func keyClicked(key: KeyboardKey) {
        switch key {
        case .number0, .number1, .number2, .number3, .number4, .number5, .number6, .number7, .number8, .number9:
            append(key.rawValue)
            break
        case .decimal:
            if let lastCharacter = getLastCharacter(), !lastCharacter.isOperand() , let lastNumberBlock = getLastNumberBlock(), !lastNumberBlock.contains(key.rawValue) {
                append(key.rawValue)
            }
            break
        case .addition, .substraction:
            if let lastCharacterKey = getLastCharacter() {
                if lastCharacterKey.isNumber() {
                    append(key.rawValue)
                } else if lastCharacterKey.isOperand() || lastCharacterKey == .decimal {
                    replaceLastCharacter(with: key.rawValue)
                }
            } else {
                //First element
                append(key.rawValue)
            }
            break
        case .equals:
            break
        }
        
        view.updateDisplay(with: currentDisplayValue)
    }
}
