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

    func resultOfOperation(result: Float?) {
        guard let result = result else {
            view.showError(error: "Cannot resolve the operation")
            return
        }
        currentDisplayValue = String.init(result)
        view.updateDisplay(with: currentDisplayValue)
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
    
    internal func append(_ value: String) {
        currentDisplayValue.append(value)
    }
    
    func keyClicked(key: KeyboardKey) {
        if let calcElement = key.calcElement() {
            currentDisplayValue = calcElement.insertInDisplay(displayValue: currentDisplayValue)
            view.updateDisplay(with: currentDisplayValue)
        } else if key == .equals {
            interactor.calculateResult(currentDisplayValue)
        } else if key == .clear {
            currentDisplayValue = ""
            view.updateDisplay(with: currentDisplayValue)
        }
    }
}
