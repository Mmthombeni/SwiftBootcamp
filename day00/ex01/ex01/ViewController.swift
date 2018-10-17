//
//  ViewController.swift
//  ex01
//
//  Created by Malebo MTHOMBENI on 2018/10/01.
//  Copyright © 2018 Malebo MTHOMBENI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloButton: UILabel!
    @IBAction func clickButton(_ sender: UIButton) {
        helloButton.text = "Hello World !"
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

