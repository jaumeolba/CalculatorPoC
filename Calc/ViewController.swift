//
//  ViewController.swift
//  Calc
//
//  Created by Jaume Ollés on 29/05/2017.
//  Copyright © 2017 Zinio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayView: UITextField!
    
    @IBOutlet weak var keyboard: Keyboard!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.keyboard.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func equalsPressed() {
        
    }
}

extension ViewController: KeyboardDelegate {
    func numberClicked(_ number: Int) {
        displayView.text = displayView.text?.appendingFormat("%d", number)
    }
    
    func decimalClicked() {
        displayView.text = displayView.text?.appending(".")
    }
    
    func operationClicked(operation: Operation) {
        displayView.text = displayView.text?.appending(operation.symbol)
    }
    
    func equalsClicked() {
        equalsPressed()
    }
}

