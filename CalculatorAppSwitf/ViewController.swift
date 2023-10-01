//
//  ViewController.swift
//  CalculatorAppSwitf
//
//  Created by Phincon on 22/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    var working: String = ""
    
    //MARK:IBOutlet
    @IBOutlet weak var calculatorWorkingLabel: UILabel!
    @IBOutlet weak var calculatorResultsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    
    //MARK: FUNCTIONS
    func clearAll() {
        working = ""
        calculatorWorkingLabel.text = ""
        calculatorResultsLabel.text = ""
    }
    func addToWorkings(value: String) {
        working = working + value
        calculatorWorkingLabel.text = working
    }
    func formatResults(results: Double) -> String {
        if(results.truncatingRemainder(dividingBy: 1) == 0)
                {
                    return String(format: "%.0f", results)
                }
                else
                {
                    return String(format: "%.2f", results)
                }
    }
    func validInput() -> Bool {
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in working{
            if(specialCharacters(char: char)){
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes {
            if(index == 0) {
                return false
            }
            if(index == working.count - 1) {
                return false
            }
            if(previous != -1) {
                if(index - previous == 1) {
                    return false
                }
            }
            previous = index
        }
        
        
        return true
    }
    func specialCharacters(char: Character) -> Bool {
        if (char == "*"){
            return true
        }
        if (char == "/"){
            return true
        }
        if (char == "+"){
            return true
        }
        return false
    }
    
    //MARK:IBAction
    @IBAction func allClearTap(_ sender: UIButton) {
        clearAll()
    }
    @IBAction func backTap(_ sender: UIButton) {
        if(!working.isEmpty) {
            working.removeLast()
            calculatorWorkingLabel.text = working
        }
    }
    @IBAction func percentTap(_ sender: UIButton) {
        addToWorkings(value: "%")
    }
    @IBAction func divideTap(_ sender: UIButton) {
        addToWorkings(value: "/")
    }
    @IBAction func timesTap(_ sender: UIButton) {
        addToWorkings(value: "*")
    }
    @IBAction func minusTap(_ sender: UIButton) {
        addToWorkings(value: "-")
    }
    @IBAction func plusTap(_ sender: UIButton) {
        addToWorkings(value: "+")
    }
    @IBAction func equalsTap(_ sender: UIButton) {
        if (validInput()) {
            let checkedWorkingForPercent = working.replacingOccurrences(of: "%", with: "*0.01")
            let expressions = NSExpression(format: checkedWorkingForPercent)
            let results = expressions.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResults(results: results)
            calculatorResultsLabel.text = resultString
        } else {
            let alert = UIAlertController(title: "Invalid Input", message: "Calculator unable to do math based input", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    @IBAction func decimalTap(_ sender: UIButton) {
        addToWorkings(value: ".")
    }
    @IBAction func zeroTap(_ sender: UIButton) {
        addToWorkings(value: "0")
    }
    @IBAction func oneTap(_ sender: UIButton) {
        addToWorkings(value: "1")
    }
    @IBAction func twoTap(_ sender: UIButton) {
        addToWorkings(value: "2")
    }
    @IBAction func threeTap(_ sender: UIButton) {
        addToWorkings(value: "3")
    }
    @IBAction func fourTap(_ sender: UIButton) {
        addToWorkings(value: "4")
    }
    @IBAction func fiveTap(_ sender: UIButton) {
        addToWorkings(value: "5")
    }
    @IBAction func sixTap(_ sender: UIButton) {
        addToWorkings(value: "6")
    }
    @IBAction func sevenTap(_ sender: UIButton) {
        addToWorkings(value: "7")
    }
    @IBAction func eightTap(_ sender: UIButton) {
        addToWorkings(value: "8")
    }
    @IBAction func nineTap(_ sender: UIButton) {
        addToWorkings(value: "9")
    }
    
    
    
    
    
}

