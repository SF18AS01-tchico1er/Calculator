//
//  ViewController.swift
//  Calculator
//
//  Created by TIEGO Ouedraogo on 1/22/19.
//  Copyright © 2019 TIEGO Ouedraogo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
  
    @IBOutlet var digitButtons: [UIButton]!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.text = "0";
    }
    @IBAction func clearButton(_ sender: UIButton) {
        label.text = "0";
    }
    
    @IBAction func digitKeyPressed(_ sender: UIButton) {

        if let titleLabel: UILabel = sender.titleLabel {
            if let digit: String = titleLabel.text {
                if label.text == "0" {
                    label.text = "";
                }
                label.text! += digit;
            }
        }
    }
    
    @IBAction func decimalButton(_ sender: UIButton) {
        if label.text == "0" {
            label.text = "";
        }
        label.text! += ".";
    }
    
    @IBAction func equalButton(_ sender: UIButton) {
        var s: String = label.text!;
        s = s.replacingOccurrences(of: "−", with: "-");
        s = s.replacingOccurrences(of: "×", with: "*");
        s = s.replacingOccurrences(of: "÷", with: ".0/");   //avoid Int division
        
        //Not attempting to detect syntax errors; would require Objective-C.
        let expression: NSExpression = NSExpression(format: s);
        if let result: NSNumber = expression.expressionValue(with: nil, context: nil) as? NSNumber {
            label.text = result.stringValue;
        }
    }
    
    
    @IBAction func operatorsButton(_ sender: UIButton) {
        
        if let titleLabel: UILabel = sender.titleLabel {
            
            if let myOperator: String = titleLabel.text {
                
                label.text! += myOperator;
            }
        }
    }
}

