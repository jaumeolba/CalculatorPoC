//
//  CalcElement.swift
//  Calc
//
//  Created by Jaume Ollés on 31/05/2017.
//  Copyright © 2017 Zinio. All rights reserved.
//

import Foundation

protocol CalcElement {
    
    init(key: KeyboardKey)
    func insertInDisplay(displayValue: String) -> String
}

extension CalcElement {
    
    func getLastCharacter(_ currentDisplayValue: String) -> KeyboardKey? {
        guard currentDisplayValue.characters.count > 0, let lastCharacter = currentDisplayValue.characters.last, let lastChar = String(.init(lastCharacter)), let lastCharacterKey = KeyboardKey(rawValue: lastChar) else {
            return nil
        }
        return lastCharacterKey
    }
    
    internal func getLastNumberBlock(_ currentDisplayValue: String) -> String? {
        
        var characterSet = CharacterSet.init()
        characterSet.insert(charactersIn: KeyboardKey.addition.rawValue)
        characterSet.insert(charactersIn: KeyboardKey.substraction.rawValue)
        let components = currentDisplayValue.components(separatedBy: characterSet)
        guard components.count > 0 else {
            return nil
        }
        return components[components.count - 1]
    }
    
    func replaceLastCharacter(_ currentDisplayValue: String, with value: String) -> String {
        var newDisplayValue = currentDisplayValue
        let lastIndex = newDisplayValue.index(before: newDisplayValue.endIndex)
        newDisplayValue = newDisplayValue.substring(to: lastIndex) + value
        return newDisplayValue
    }
    
    func appendCharacter(_ currentDisplayValue: String, value: String) -> String {
        var newDisplayValue = currentDisplayValue
        newDisplayValue.append(value)
        return newDisplayValue
    }
}

class NumberElement: CalcElement {
    
    private let key: KeyboardKey
    
    required init(key: KeyboardKey) {
        self.key = key
    }
    
    func insertInDisplay(displayValue: String) -> String {
        return appendCharacter(displayValue, value: key.rawValue)
    }
}

class OperatorElement: CalcElement {
    
    private let key: KeyboardKey
    
    required init(key: KeyboardKey) {
        self.key = key
    }
    
    func insertInDisplay(displayValue: String) -> String {
        if let lastCharacterKey = getLastCharacter(displayValue) {
            if lastCharacterKey.isNumber() {
                return appendCharacter(displayValue, value: key.rawValue)
            } else if lastCharacterKey.isOperator() || lastCharacterKey == .decimal {
                return replaceLastCharacter(displayValue, with: key.rawValue)
            } else {
                return displayValue
            }
        } else {
            //First element
            return appendCharacter(displayValue, value: key.rawValue)
        }
    }
}

class DecimalElement: CalcElement {
    
    private let key: KeyboardKey
    
    required init(key: KeyboardKey) {
        self.key = key
    }
    
    func insertInDisplay(displayValue: String) -> String {
        if let lastCharacter = getLastCharacter(displayValue), !lastCharacter.isOperator() , let lastNumberBlock = getLastNumberBlock(displayValue), !lastNumberBlock.contains(key.rawValue) {
            return appendCharacter(displayValue, value: key.rawValue)
        }
        return displayValue
    }
}
