//
//  ViewController.swift
//  ex03
//
//  Created by Malebo MTHOMBENI on 2018/10/02.
//  Copyright © 2018 Malebo MTHOMBENI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var screenLabel: UILabel!
    var number:Double = 0
    var operatorValue:String = ""
    var calcNumber:Double = 0
    var isEqualsClick:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func numberButton(_ sender: UIButton) {
        var str: String = ""
        if (isEqualsClick == true){
            str = sender.currentTitle!
            number = Double(str)!
            isEqualsClick = false
        }else{
            str = screenLabel.text! + sender.currentTitle!
            number = Double(str)!
        }
        
        screenLabel.text = str
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        number = 0
        screenLabel.text = ""
        calcNumber = 0
        isEqualsClick = false
        operatorValue = ""
    }
    
    @IBAction func negButton(_ sender: UIButton) {
        let i: Int = Int(screenLabel.text!)! * -1
        screenLabel.text = String(i)
    }
    
    @IBAction func mathOpButton(_ sender: UIButton) {
        operatorValue = sender.currentTitle!
        calcNumber = Double(screenLabel.text!) ?? number
        screenLabel.text = ""
    }
    
    @IBAction func equalButton(_ sender: UIButton) {
        var answer:Double = 0
        let num: Double = Double(screenLabel.text!) ?? 0
        isEqualsClick = true
        
        if operatorValue == "+" {
            answer = (calcNumber) + (num)
        }
        else if (operatorValue == "-"){
            answer = (calcNumber) - (num)
        }
        else if (operatorValue == "*"){
            answer = (calcNumber) * (num)
        }
        else if (operatorValue == "/"){
//            if (calcNumber == 0){
//                answer = 0
//                screenLabel.text = String(answer)
//                number = answer
//                isEqualsClick = true
//                return
//            }
/*          else*/ if (num == 0){
                screenLabel.text = "ERROR"
                calcNumber = 0
                number = 0
                return
            }
            else{
                answer = (calcNumber) / (num)
                screenLabel.text = String(answer)
                number = answer
    
                return
            }
        }
        screenLabel.text = String(answer)
        
    }
}
