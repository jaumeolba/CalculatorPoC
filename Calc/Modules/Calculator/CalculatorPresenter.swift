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
    func numberClicked(_ number: Int) {
        
        view.appendToDisplay(String.init(format: "%d", number))
    }
    
    func decimalClicked() {
        view.appendToDisplay(".")
    }
    
    func operationClicked(operation: Operation) {
        view.appendToDisplay(operation.symbol)
    }
    
    func equalsClicked() {
        equalsPressed()
    }
}
