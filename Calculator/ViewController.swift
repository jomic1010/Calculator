//
//  ViewController.swift
//  Calculator
//
//  Created by JomiC on 2020/07/24.
//  Copyright © 2020 JomiC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 연산자 종류
    var operation = 0
    // 결과
    var printNum: Double = 0
    // 연산에 필요한 숫자
    var tempNum: Double = 0
    // 연산자 선택 여부
    var isSelectedOperatior: Bool = false
    // 소숫점 자릿수
    var decimal = 0
    
    var isFraction: Bool = false
    
    var howManyFraction = 0
    
    // 결과 Label
    @IBOutlet weak var result: UILabel!
    
    // C Button
    @IBOutlet weak var reset: UIButton!
    // +/- Button
    @IBOutlet weak var sign: UIButton!
    // + Button
    @IBOutlet weak var plus: UIButton!
    // - Button
    @IBOutlet weak var minus: UIButton!
    // . Button
    @IBOutlet weak var dot: UIButton!
    // % Button
    @IBOutlet weak var percentage: UIButton!
    // * Button
    @IBOutlet weak var multiply: UIButton!
    // / Buton
    @IBOutlet weak var division: UIButton!
    // = Button
    @IBOutlet weak var resultBtn: UIButton!
    
    // 0 Button
    @IBOutlet weak var num0: UIButton!
    // 1 Button
    @IBOutlet weak var num1: UIButton!
    // 2 Button
    @IBOutlet weak var num2: UIButton!
    // 3 Button
    @IBOutlet weak var num3: UIButton!
    // 4 Button
    @IBOutlet weak var num4: UIButton!
    // 5 Button
    @IBOutlet weak var num5: UIButton!
    // 6 Button
    @IBOutlet weak var num6: UIButton!
    // 7 Button
    @IBOutlet weak var num7: UIButton!
    // 8 Button
    @IBOutlet weak var num8: UIButton!
    // 9 Button
    @IBOutlet weak var num9: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func removePoint(num: Double) -> String {
            var floatNumString = String(num)
            
            if num == floor(num) {
                for _ in 0..<floatNumString.count {
                    if floatNumString.last == "." {
                        floatNumString.removeLast()
                        break
                    }
                    else {
                        floatNumString.removeLast()
                    }
                }
            }
            
            return floatNumString
    }
    
    // 숫자 버튼 클릭
    func clickNum(_ a: Double) {
        
        var fraction = a
        var powTen = 1
        
        
        if howManyFraction > 0 {
            for _ in 0..<howManyFraction {
                fraction *= 0.1
                powTen *= 10
                fraction = round(fraction * Double(powTen)) / Double(powTen)
            }
            printNum += fraction
            printNum = round(printNum * Double(powTen)) / Double(powTen)
            howManyFraction += 1
        }
        else {
            printNum = printNum * 10 + a
        }
        self.result.text = removePoint(num: printNum)
    }
    
    /*
      operation
      1: plus +
      2: minus -
      3: multiply *
      4: division /
    */
    // 연산자 버튼 클릭
    func clickExpression(_ num: Int) {
        guard !isSelectedOperatior else {
            return
        }
        isSelectedOperatior = true
        operation = num
        tempNum = printNum
        printNum = 0
        dotInit()
    }
    
    // 계산 함수
    func operateNum(_ a: Double, _ b: Double, operation: (Double, Double) -> Double) {
        printNum = operation(a, b)
        result.text = String(printNum)
        dotInit()
    }
    
    // 덧셈 계산
    var operatePlus: (Double, Double) -> Double = { $0 + $1 }
    // 뺄셈 계산
    var operateMinus: (Double, Double) -> Double = { $0 - $1 }
    // 곱셈 계산
    var operateMultiply: (Double, Double) -> Double = { $0 * $1 }
    // 나눗셈 계산
    var operateDivision: (Double, Double) -> Double = { $0 / $1 }
    
    func operatePercent(_ a: Double, _ b: Double, operationPercent: (Double, Double) -> Double) {
        printNum = operationPercent(a, b)
        result.text = String(printNum)
        dotInit()
    }
    
    var operatePercentPlus: (Double, Double) -> Double = { $0 + ($0 * ($1 / 100)) }
    var operatePercentMinus: (Double, Double) -> Double = { $0 - ($0 * ($1 / 100)) }
    var operatePercentMultiply: (Double, Double) -> Double = { $0 * ($1 / 100) }
    
    // 콤마 계산 수정 필요
    func operateDot(num: Double) -> String {
        var numToString = String(num)
        
        if num == floor(num) {
            for _ in 0..<numToString.count {
                if numToString.last == "." {
                    numToString.removeLast()
                    break
                }
                else {
                    numToString.removeLast()
                }
            }
        }
        
        return numToString
    }
    
    // 부호 버튼
    @IBAction func clickSignBtn(_ sender: UIButton) {
        printNum *= -1
        result.text = String(printNum)
    }
    
    @IBAction func clickDotBtn(_ sender: UIButton) {
        if !isFraction {
            isFraction = true
            howManyFraction += 1
            self.result.text = operateDot(num: printNum) + "."
        }
    }
    
    // % 버튼 클릭
    @IBAction func clickPercentBtn(_ sender: Any) {
        switch operation {
        case 1:
            operatePercent(tempNum, printNum, operationPercent: operatePercentPlus)
        case 2:
            operatePercent(tempNum, printNum, operationPercent: operatePercentMinus)
        case 3:
            operatePercent(tempNum, printNum, operationPercent: operatePercentMultiply)
        default:
            break
        }
        operation = 0
        isSelectedOperatior = false
        dotInit()
    }
    
    // = 버튼 클릭
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
        dotInit()
    }
    
    // C 버튼 클릭
    @IBAction func clickResetBtn(_ sender: UIButton) {
        printNum = 0
        tempNum = 0
        dotInit()
        result.text = "0"
    }
    
    func dotInit() {
        decimal = 0
        howManyFraction = 0
        isFraction = false
    }

    // + 버튼 클릭
    @IBAction func clickPlus(_ sender: UIButton) { clickExpression(1) }
    
    // - 버튼 클릭
    @IBAction func clickMinus(_ sender: UIButton) { clickExpression(2) }
    
    // * 버튼 클릭
    @IBAction func clickMultiply(_ sender: UIButton) { clickExpression(3) }
    
    // / 버튼 클릭
    @IBAction func clickDivision(_ sender: UIButton) { clickExpression(4) }
    
    // 1 버튼 클릭
    @IBAction func clickNum1Btn(_ sender: UIButton) { clickNum(1) }
    
    // 2 버튼 클릭
    @IBAction func clickNum2Btn(_ sender: UIButton) { clickNum(2) }
    
    // 3 버튼 클릭
    @IBAction func clickNum3Btn(_ sender: UIButton) { clickNum(3) }
    
    // 4 버튼 클릭
    @IBAction func clickNum4Btn(_ sender: UIButton) { clickNum(4) }
    
    // 5 버튼 클릭
    @IBAction func clickNum5Btn(_ sender: UIButton) { clickNum(5) }
    
    // 6 버튼 클릭
    @IBAction func clickNum6Btn(_ sender: UIButton) { clickNum(6) }
    
    // 7 버튼 클릭
    @IBAction func clickNum7Btn(_ sender: UIButton) { clickNum(7) }
    
    // 8 버튼 클릭
    @IBAction func clickNum8Btn(_ sender: UIButton) { clickNum(8) }
    
    // 9 버튼 클릭
    @IBAction func clickNum9Btn(_ sender: UIButton) { clickNum(9) }
    
    // 0 버튼 클릭
    @IBAction func clickNum0Btn(_ sender: UIButton) { clickNum(0) }
    
    
    
    
}

