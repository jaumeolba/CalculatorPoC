//
//  CalcElementTests.swift
//  Calc
//
//  Created by Jaume Ollés on 01/06/2017.
//  Copyright © 2017 Zinio. All rights reserved.
//

import XCTest
@testable import Calc

class CalcElementTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetLastCharacter() {
        var lastCharacter = CalcUtils.getLastCharacter("1234+5678")
        XCTAssert(lastCharacter == KeyboardKey.number8)
        lastCharacter = CalcUtils.getLastCharacter("1234+")
        XCTAssert(lastCharacter == KeyboardKey.addition)
        lastCharacter = CalcUtils.getLastCharacter("1234+5678.")
        XCTAssert(lastCharacter == KeyboardKey.decimal)
    }
    
    func testGetLastNumberBlock() {
        var lastNumberBlock = CalcUtils.getLastNumberBlock("1234+5678")
        XCTAssert(lastNumberBlock == "5678")
        lastNumberBlock = CalcUtils.getLastNumberBlock("1234+")
        XCTAssert(lastNumberBlock == "")
        lastNumberBlock = CalcUtils.getLastNumberBlock("1234+5678.")
        XCTAssert(lastNumberBlock == "5678.")
        lastNumberBlock = CalcUtils.getLastNumberBlock("1234+5678.34")
        XCTAssert(lastNumberBlock == "5678.34")
    }
    
    func testReplaceLastCharacter() {
        var newValue = CalcUtils.replaceLastCharacter("1234+5678", with: "*")
        XCTAssert(newValue == "1234+567*")
        newValue = CalcUtils.replaceLastCharacter("1234+", with: "*")
        XCTAssert(newValue == "1234*")
        newValue = CalcUtils.replaceLastCharacter("1234+5678.", with: "*")
        XCTAssert(newValue == "1234+5678*")
        newValue = CalcUtils.replaceLastCharacter("1234+5678.34", with: "*")
        XCTAssert(newValue == "1234+5678.3*")
    }
    
    func testAppendCharacterr() {
        var newValue = CalcUtils.appendCharacter("1234+5678", value: "5")
        XCTAssert(newValue == "1234+56785")
        newValue = CalcUtils.appendCharacter("1234+", value: "5")
        XCTAssert(newValue == "1234+5")
        newValue = CalcUtils.appendCharacter("1234+5678.", value: "5")
        XCTAssert(newValue == "1234+5678.5")
        newValue = CalcUtils.appendCharacter("1234+5678.34", value: "5")
        XCTAssert(newValue == "1234+5678.345")
    }
    
    func testNumberElement() {
        let numberElement = NumberElement(key: .number1)
        var newValue = numberElement.insertInDisplay(displayValue: "1234")
        XCTAssert(newValue == "12341")
        newValue = numberElement.insertInDisplay(displayValue: "1234+")
        XCTAssert(newValue == "1234+1")
        newValue = numberElement.insertInDisplay(displayValue: "1234.")
        XCTAssert(newValue == "1234.1")
        newValue = numberElement.insertInDisplay(displayValue: "")
        XCTAssert(newValue == "1")
    }
    
    func testOperatorElement() {
        let numberElement = OperatorElement(key: .addition)
        var newValue = numberElement.insertInDisplay(displayValue: "1234")
        XCTAssert(newValue == "1234+")
        newValue = numberElement.insertInDisplay(displayValue: "1234+")
        XCTAssert(newValue == "1234+")
        newValue = numberElement.insertInDisplay(displayValue: "1234.")
        XCTAssert(newValue == "1234+")
        newValue = numberElement.insertInDisplay(displayValue: "1234-")
        XCTAssert(newValue == "1234+")
        newValue = numberElement.insertInDisplay(displayValue: "")
        XCTAssert(newValue == "+")
    }
    
    func testDecimalElement() {
        let numberElement = DecimalElement(key: .decimal)
        var newValue = numberElement.insertInDisplay(displayValue: "1234")
        XCTAssert(newValue == "1234.")
        newValue = numberElement.insertInDisplay(displayValue: "1234.34")
        XCTAssert(newValue == "1234.34")
        newValue = numberElement.insertInDisplay(displayValue: "1234+")
        XCTAssert(newValue == "1234+")
        newValue = numberElement.insertInDisplay(displayValue: "1234.")
        XCTAssert(newValue == "1234.")
        newValue = numberElement.insertInDisplay(displayValue: "1234-")
        XCTAssert(newValue == "1234-")
        newValue = numberElement.insertInDisplay(displayValue: "")
        XCTAssert(newValue == "")
    }
}
