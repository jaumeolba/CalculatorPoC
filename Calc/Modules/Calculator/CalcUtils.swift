//
//  CalcUtils.swift
//  Calc
//
//  Created by Jaume Ollés on 01/06/2017.
//  Copyright © 2017 Zinio. All rights reserved.
//

import Foundation


class CalcUtils {
    static func getLastCharacter(_ currentDisplayValue: String) -> KeyboardKey? {
        guard currentDisplayValue.characters.count > 0, let lastCharacter = currentDisplayValue.characters.last, let lastChar = String(.init(lastCharacter)), let lastCharacterKey = KeyboardKey(rawValue: lastChar) else {
            return nil
        }
        return lastCharacterKey
    }
    
    static func getLastNumberBlock(_ currentDisplayValue: String) -> String? {
        
        var characterSet = CharacterSet.init()
        characterSet.insert(charactersIn: KeyboardKey.addition.rawValue)
        characterSet.insert(charactersIn: KeyboardKey.substraction.rawValue)
        let components = currentDisplayValue.components(separatedBy: characterSet)
        guard components.count > 0 else {
            return nil
        }
        return components[components.count - 1]
    }
    
    static func replaceLastCharacter(_ currentDisplayValue: String, with value: String) -> String {
        var newDisplayValue = currentDisplayValue
        let lastIndex = newDisplayValue.index(before: newDisplayValue.endIndex)
        newDisplayValue = newDisplayValue.substring(to: lastIndex) + value
        return newDisplayValue
    }
    
    static func appendCharacter(_ currentDisplayValue: String, value: String) -> String {
        var newDisplayValue = currentDisplayValue
        newDisplayValue.append(value)
        return newDisplayValue
    }
}
