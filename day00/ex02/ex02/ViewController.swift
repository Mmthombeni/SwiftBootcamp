//
//  ViewController.swift
//  ex02
//
//  Created by Malebo MTHOMBENI on 2018/10/01.
//  Copyright © 2018 Malebo MTHOMBENI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var screenLabel: UILabel!
    @IBAction func clickButton(_ sender: UIButton) {
        screenLabel.text = sender.currentTitle
        print(">> ",sender.currentTitle!)
    }
    @IBAction func operatorButton(_ sender: UIButton) {
        print(">> ",sender.currentTitle!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

