//
//  CalculatorPresenterTests.swift
//  Calc
//
//  Created by Jaume Ollés on 01/06/2017.
//  Copyright © 2017 Zinio. All rights reserved.
//

import XCTest
@testable import Calc
//
//class StubCalculatorView: CalculatorViewInterface {
//    
//    var result: String = ""
//    
//    func updateDisplay(with value: String?) {
//        result.append("updateDisplay - \(String(describing: value))")
//    }
//    
//    func showError(error: String) {
//        result.append("showError - \(String(describing: error))")
//    }
//}
//
//class StubCalculatorInteractor: CalculatorInteractor {
//    
//    var result: String = ""
//    
//    override func calculateResult(_ display: String) {
//        result.append("calculateResult - \(display)")
//    }
//}

class CalcPresenterTests: XCTestCase {
    
    var presenter: CalculatorPresenter!
//    var view: StubCalculatorView!
    
    override func setUp() {
        super.setUp()
//        view = StubCalculatorView()
        presenter = CalculatorPresenter()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testKeyClicked() {
//        presenter.keyClicked(key: .number2)
//        XCTAssertTrue(view.displayView.text == "2")
//        presenter.keyClicked(key: .number5)
//        XCTAssertTrue(view.displayView.text == "25")
//        presenter.keyClicked(key: .number6)
//        XCTAssertTrue(view.displayView.text == "256")
//        presenter.keyClicked(key: .decimal)
//        XCTAssertTrue(view.displayView.text == "256.")
//        presenter.keyClicked(key: .decimal)
//        XCTAssertTrue(view.displayView.text == "256.")
//        presenter.keyClicked(key: .number0)
//        XCTAssertTrue(view.displayView.text == "256.0")
//        presenter.keyClicked(key: .decimal)
//        XCTAssertTrue(view.displayView.text == "256.0")
//        presenter.keyClicked(key: .number5)
//        XCTAssertTrue(view.displayView.text == "256.05")
//        presenter.keyClicked(key: .addition)
//        XCTAssertTrue(view.displayView.text == "256.05+")
//        presenter.keyClicked(key: .number4)
//        XCTAssertTrue(view.displayView.text == "256.05+4")
//        presenter.keyClicked(key: .clear)
//        XCTAssertTrue(view.displayView.text == "")
//        presenter.keyClicked(key: .number2)
//        XCTAssertTrue(view.displayView.text == "2")
//        presenter.keyClicked(key: .number5)
//        XCTAssertTrue(view.displayView.text == "25")
//        presenter.keyClicked(key: .number6)
//        XCTAssertTrue(view.displayView.text == "256")
//        presenter.keyClicked(key: .decimal)
//        XCTAssertTrue(view.displayView.text == "256.")
//        presenter.keyClicked(key: .number0)
//        XCTAssertTrue(view.displayView.text == "256.0")
//        presenter.keyClicked(key: .number5)
//        XCTAssertTrue(view.displayView.text == "256.05")
//        presenter.keyClicked(key: .addition)
//        XCTAssertTrue(view.displayView.text == "256.05+")
//        presenter.keyClicked(key: .substraction)
//        XCTAssertTrue(view.displayView.text == "256.05-")
//        presenter.keyClicked(key: .number2)
//        XCTAssertTrue(view.displayView.text == "256.05-2")
//        presenter.keyClicked(key: .number5)
//        XCTAssertTrue(view.displayView.text == "256.05-25")
    }
    
}
