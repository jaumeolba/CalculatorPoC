//
//  CalculatorView.swift
//  Calc
//
//  Created by Jaume Ollés on 29/05/2017.
//  Copyright © 2017 Zinio. All rights reserved.
//

import UIKit
import Viperit

//MARK: - Public Interface Protocol
protocol CalculatorViewInterface {
    func updateDisplay(with value: String?)
    func updateResultDisplay(with value: String?)
    func showError(error: String)
}

//MARK: Calculator View
class CalculatorView: UserInterface {
    
    @IBOutlet weak var displayView: UITextField!
    
    @IBOutlet weak var resultView: UITextField!
    @IBOutlet weak var keyboard: Keyboard!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyboard.delegate = presenter
        displayView.isEnabled = false
        resultView.isEnabled = false
    }
    
}

//MARK: - Public interface
extension CalculatorView: CalculatorViewInterface {
    func showError(error: String) {
        //TODO: Show alert error
        UIAlertController(title: nil, message: error, preferredStyle: .alert).show(self, sender: nil)
    }

    
    func updateDisplay(with value: String?) {
        displayView.text = value
    }
    
    func updateResultDisplay(with value: String?) {
        resultView.text = value
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension CalculatorView {
    var presenter: CalculatorPresenter {
        return _presenter as! CalculatorPresenter
    }
    var displayData: CalculatorDisplayData {
        return _displayData as! CalculatorDisplayData
    }
}
