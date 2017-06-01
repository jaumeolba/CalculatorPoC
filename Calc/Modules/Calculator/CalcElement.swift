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
    
    
}

class NumberElement: CalcElement {
    
    private let key: KeyboardKey
    
    required init(key: KeyboardKey) {
        self.key = key
    }
    
    func insertInDisplay(displayValue: String) -> String {
        return CalcUtils.appendCharacter(displayValue, value: key.rawValue)
    }
}

class OperatorElement: CalcElement {
    
    private let key: KeyboardKey
    
    required init(key: KeyboardKey) {
        self.key = key
    }
    
    func insertInDisplay(displayValue: String) -> String {
        if let lastCharacterKey = CalcUtils.getLastCharacter(displayValue) {
            if lastCharacterKey.isNumber() {
                return CalcUtils.appendCharacter(displayValue, value: key.rawValue)
            } else if lastCharacterKey.isOperator() || lastCharacterKey == .decimal {
                return CalcUtils.replaceLastCharacter(displayValue, with: key.rawValue)
            } else {
                return displayValue
            }
        } else {
            //First element
            return CalcUtils.appendCharacter(displayValue, value: key.rawValue)
        }
    }
}

class DecimalElement: CalcElement {
    
    private let key: KeyboardKey

    required init(key: KeyboardKey) {
        self.key = key
    }
    
    func insertInDisplay(displayValue: String) -> String {
        if let lastCharacter = CalcUtils.getLastCharacter(displayValue), !lastCharacter.isOperator() , let lastNumberBlock = CalcUtils.getLastNumberBlock(displayValue), !lastNumberBlock.contains(key.rawValue) {
            return CalcUtils.appendCharacter(displayValue, value: key.rawValue)
        }
        return displayValue
    }
}
