//
//  OperatorTests.swift
//  Calc
//
//  Created by Jaume Ollés on 01/06/2017.
//  Copyright © 2017 Zinio. All rights reserved.
//

import XCTest
@testable import Calc

class OperatorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAdditionOperator() {
        let additionOperator = AdditionOperator()
        
        var firstOperand: Float = 973456
        var secondOperand: Float = 9238465
        XCTAssert(additionOperator.calculate(firstOperand: firstOperand, secondOperand: secondOperand) == firstOperand + secondOperand)
        
        firstOperand = 3465
        secondOperand = 56856785687
        XCTAssert(additionOperator.calculate(firstOperand: firstOperand, secondOperand: secondOperand) == firstOperand + secondOperand)
        
        firstOperand = 3465.93846
        secondOperand = 56856785687.9723469765234
        XCTAssert(additionOperator.calculate(firstOperand: firstOperand, secondOperand: secondOperand) == firstOperand + secondOperand)
    }
    
    func testSubstractionOperator() {
        let additionOperator = SubstractionOperator()
        
        var firstOperand: Float = 973456
        var secondOperand: Float = 923
        XCTAssert(additionOperator.calculate(firstOperand: firstOperand, secondOperand: secondOperand) == firstOperand - secondOperand)
        
        firstOperand = 3465
        secondOperand = 56856785687
        XCTAssert(additionOperator.calculate(firstOperand: firstOperand, secondOperand: secondOperand) == firstOperand - secondOperand)
        
        firstOperand = 3465.93846
        secondOperand = 56856785687.9723469765234
        XCTAssert(additionOperator.calculate(firstOperand: firstOperand, secondOperand: secondOperand) == firstOperand - secondOperand)
    }
}
