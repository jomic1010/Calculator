//
//  ViewController.swift
//  Calculator
//
//  Created by JomiC on 2020/07/24.
//  Copyright © 2020 JomiC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var expression: Float = 0
    var num: Int = 0
    var resultStr: String = "0"
    
    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var reset: UIButton!
    @IBOutlet weak var sign: UIButton!
    @IBOutlet weak var leftBracket: UIButton!
    @IBOutlet weak var rightBracket: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var dot: UIButton!
    @IBOutlet weak var percentage: UIButton!
    @IBOutlet weak var multiply: UIButton!
    @IBOutlet weak var division: UIButton!
    
    @IBOutlet weak var num0: UIButton!
    @IBOutlet weak var num1: UIButton!
    @IBOutlet weak var num2: UIButton!
    @IBOutlet weak var num3: UIButton!
    @IBOutlet weak var num4: UIButton!
    @IBOutlet weak var num5: UIButton!
    @IBOutlet weak var num6: UIButton!
    @IBOutlet weak var num7: UIButton!
    @IBOutlet weak var num8: UIButton!
    @IBOutlet weak var num9: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func clickResetBtn(_ sender: UIButton) {
        resultStr = "0"
        result.text = "0"
        expression = 0
    }
    
    @IBAction func clickNum1Btn(_ sender: UIButton) {
        if expression == 0 {
            resultStr = "1"
            expression = 1
            result.text = "1"
        } else {
            resultStr += "1"
            result.text = resultStr
            expression = NSString(string: resultStr).floatValue
        }
    }
    
    @IBAction func clickNum2Btn(_ sender: UIButton) {
        if expression == 0 {
            resultStr = "2"
            expression = 2
            result.text = "2"
        } else {
            resultStr += "2"
            result.text = resultStr
            expression = NSString(string: resultStr).floatValue
        }
    }
    
    @IBAction func clickNum3Btn(_ sender: UIButton) {
        if expression == 0 {
            resultStr = "3"
            expression = 3
            result.text = "3"
        } else {
            resultStr += "3"
            result.text = resultStr
            expression = NSString(string: resultStr).floatValue
        }
    }
    
    @IBAction func clickNum4Btn(_ sender: UIButton) {
        if expression == 0 {
            resultStr = "4"
            expression = 4
            result.text = "4"
        } else {
            resultStr += "4"
            result.text = resultStr
            expression = NSString(string: resultStr).floatValue
        }
    }
    
    @IBAction func clickNum5Btn(_ sender: UIButton) {
        if expression == 0 {
            resultStr = "5"
            expression = 5
            result.text = "5"
        } else {
            resultStr += "5"
            result.text = resultStr
            expression = NSString(string: resultStr).floatValue
        }
    }
    
    @IBAction func clickNum6Btn(_ sender: UIButton) {
        if expression == 0 {
            resultStr = "6"
            expression = 6
            result.text = "6"
        } else {
            resultStr += "6"
            result.text = resultStr
            expression = NSString(string: resultStr).floatValue
        }
    }
    
    @IBAction func clickNum7Btn(_ sender: UIButton) {
        if expression == 0 {
            resultStr = "7"
            expression = 7
            result.text = "7"
        } else {
            resultStr += "7"
            result.text = resultStr
            expression = NSString(string: resultStr).floatValue
        }
    }
    
    @IBAction func clickNum8Btn(_ sender: UIButton) {
        if expression == 0 {
            resultStr = "8"
            expression = 8
            result.text = "8"
        } else {
            resultStr += "8"
            result.text = resultStr
            expression = NSString(string: resultStr).floatValue
        }
    }
    
    @IBAction func clickNum9Btn(_ sender: UIButton) {
        if expression == 0 {
            resultStr = "9"
            expression = 9
            result.text = "9"
        } else {
            resultStr += "9"
            result.text = resultStr
            expression = NSString(string: resultStr).floatValue
        }
    }
    
    @IBAction func clickNum0Btn(_ sender: UIButton) {
        if expression == 0 {
            resultStr = "0"
            expression = 0
            result.text = "0"
        } else {
            resultStr += "0"
            result.text = resultStr
            expression = NSString(string: resultStr).floatValue
        }
    }
    
    
    
    
}

