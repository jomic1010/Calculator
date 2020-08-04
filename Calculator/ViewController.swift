//
//  ViewController.swift
//  Calculator
//
//  Created by JomiC on 2020/07/24.
//  Copyright © 2020 JomiC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var operation = 0
    var printNum = 0
    var isSelectedOperatior: Bool = false
    var tempNum = 0
    
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
    @IBOutlet weak var resultBtn: UIButton!
    
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
    
    func clickNum(_ a: Int) {
        printNum = printNum * 10 + a
        result.text = String(printNum)
    }
    
    /*
      operation
      1: plus
      2: minus
      3: multiply
      4: division
    */
    func clickExpression(_ num: Int) {
        guard !isSelectedOperatior else {
            return
        }
        isSelectedOperatior = true
        operation = num
        tempNum = printNum
        printNum = 0
    }
    
    func operateNum(_ a: Int, _ b: Int, operation: (Int, Int) -> Int) {
        printNum = operation(a, b)
        result.text = String(printNum)
    }
    
    var operatePlus: (Int, Int) -> Int = { $0 + $1 }
    var operateMinus: (Int, Int) -> Int = { $0 - $1 }
    var operateMultiply: (Int, Int) -> Int = { $0 * $1 }
    var operateDivision: (Int, Int) -> Int = { $0 / $1 }
    
    @IBAction func clickResultBtn(_ sender: Any) {
        switch operation {
        case 1:
            operateNum(tempNum, printNum, operation: operatePlus)
        case 2:
            operateNum(tempNum, printNum, operation: operateMinus)
        case 3:
            operateNum(tempNum, printNum, operation: operateMultiply)
        case 4:
            operateNum(tempNum, printNum, operation: operateDivision)
        default:
            break
        }
        operation = 0
        isSelectedOperatior = false
    }
    
    @IBAction func clickResetBtn(_ sender: UIButton) {
        printNum = 0
        tempNum = 0
        result.text = "0"
    }

    @IBAction func clickPlus(_ sender: UIButton) { clickExpression(1) }
    
    @IBAction func clickMinus(_ sender: UIButton) { clickExpression(2) }
    
    @IBAction func clickMultiply(_ sender: UIButton) { clickExpression(3) }
    
    @IBAction func clickDivision(_ sender: UIButton) { clickExpression(4) }
    
    @IBAction func clickNum1Btn(_ sender: UIButton) { clickNum(1) }
    
    @IBAction func clickNum2Btn(_ sender: UIButton) { clickNum(2) }
    
    @IBAction func clickNum3Btn(_ sender: UIButton) { clickNum(3) }
    
    @IBAction func clickNum4Btn(_ sender: UIButton) { clickNum(4) }
    
    @IBAction func clickNum5Btn(_ sender: UIButton) { clickNum(5) }
    
    @IBAction func clickNum6Btn(_ sender: UIButton) { clickNum(6) }
    
    @IBAction func clickNum7Btn(_ sender: UIButton) { clickNum(7) }
    
    @IBAction func clickNum8Btn(_ sender: UIButton) { clickNum(8) }
    
    @IBAction func clickNum9Btn(_ sender: UIButton) { clickNum(9) }
    
    @IBAction func clickNum0Btn(_ sender: UIButton) { clickNum(0) }
    
    
    
    
}

