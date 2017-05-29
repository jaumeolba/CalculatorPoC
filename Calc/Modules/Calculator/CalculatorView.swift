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
    func appendToDisplay(_ value: String)
}

//MARK: Calculator View
final class CalculatorView: UserInterface {
    
    @IBOutlet weak var displayView: UITextField!
    
    @IBOutlet weak var keyboard: Keyboard!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyboard.delegate = presenter
    }
    
}

//MARK: - Public interface
extension CalculatorView: CalculatorViewInterface {
    
    func appendToDisplay(_ value: String) {
        displayView.text = displayView.text?.appending(value)
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
