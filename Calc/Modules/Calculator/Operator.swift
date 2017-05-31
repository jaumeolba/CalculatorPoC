//
//  Operator.swift
//  Calc
//
//  Created by Jaume Ollés on 31/05/2017.
//  Copyright © 2017 Zinio. All rights reserved.
//

import Foundation

protocol Operator {
    func calculate(firstOperand: Float, secondOperand: Float) -> Float
}

class AdditionOperator: Operator {
    func calculate(firstOperand: Float, secondOperand: Float) -> Float{
            return firstOperand + secondOperand
    }
}

class SubstractionOperator: Operator {
    func calculate(firstOperand: Float, secondOperand: Float) -> Float{
        return firstOperand - secondOperand
    }
}
