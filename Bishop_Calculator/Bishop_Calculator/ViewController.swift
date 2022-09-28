//
//  ViewController.swift
//  Bishop_Calculator
//
//  Created by Bishop,Mackenzie N on 9/27/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var calculatorWorkings: UILabel!
    @IBOutlet weak var calculatorResults: UILabel!
    
    var workings:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        clearAll()
    }
    
    func clearAll() {
        workings = ""
        calculatorWorkings.text = ""
        calculatorResults.text = ""
    }
    @IBAction func buttonAllClear(_ sender: Any) {
        if(!workings.isEmpty){
            workings.removeAll()
            calculatorWorkings.text = workings
        }
    }
    
    @IBAction func buttonClear(_ sender: Any) {
        if(!workings.isEmpty){
            workings.removeAll()
            calculatorWorkings.text = workings
        }
    }
    
    func addToWorkings(value:String){
        workings = workings + value
        calculatorWorkings.text = workings
    }
    
    @IBAction func buttonPercent(_ sender: Any) {
        addToWorkings(value: "%")
    }
    
    @IBAction func buttonDivide(_ sender: Any) {
        addToWorkings(value: "/")
    }
    
    @IBAction func buttonMultiply(_ sender: Any) {
        addToWorkings(value: "*")
    }
    
    @IBAction func buttonMinus(_ sender: Any) {
        addToWorkings(value: "-")
    }
    
    @IBAction func buttonPlus(_ sender: Any) {
        addToWorkings(value: "+")
    }
    
    @IBAction func buttonEquals(_ sender: Any) {
        if (validInput()) {
            let checkForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: workings)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calculatorResults.text = resultString
        }
        else {
            let errorAlert = UIAlertController(title: "Error",
                                               message: "Error",
                                               preferredStyle: .alert)
            errorAlert.addAction(UIAlertAction(title: "Valid", style: .default))
            self.present(errorAlert, animated: true, completion: nil)
        }
    }
    
    func validInput() -> Bool {
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in workings {
            if (specialCharacter(char: char)){
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes {
            if (index == 0){
                return false
            }
            if (index == workings.count - 1){
                return false
            }
            if (previous != -1){
                if (index - previous == 1){
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    func specialCharacter (char: Character) -> Bool {
        if (char == "*"){
            return true
        }
        if (char == "/"){
            return true
        }
        if (char == "+"){
            return true
        }
        if (char == "-"){
            return true
        }
        return false
    }
    
    func formatResult(result: Double) -> String {
        if (result.truncatingRemainder(dividingBy: 1) == 0){
            return String(format: "%.0f", result)
        }
        else {
            return String(format: "%.2f", result)
        }
    }
    
    @IBAction func buttonDecimal(_ sender: Any) {
        addToWorkings(value: ".")
    }
    
    @IBAction func button0(_ sender: Any) {
        addToWorkings(value: "0")
    }
    
    @IBAction func button1(_ sender: Any) {
        addToWorkings(value: "1")
    }
    
    @IBAction func button2(_ sender: Any) {
        addToWorkings(value: "2")
    }
    
    @IBAction func button3(_ sender: Any) {
        addToWorkings(value: "3")
    }
    
    @IBAction func button4(_ sender: Any) {
        addToWorkings(value: "4")
    }
    
    @IBAction func button5(_ sender: Any) {
        addToWorkings(value: "5")
    }
    
    @IBAction func button6(_ sender: Any) {
        addToWorkings(value: "6")
    }
    
    @IBAction func button7(_ sender: Any) {
        addToWorkings(value: "7")
    }
    
    @IBAction func button8(_ sender: Any) {
        addToWorkings(value: "8")
    }
    
    @IBAction func button9(_ sender: Any) {
        addToWorkings(value: "9")
    }
    
}

