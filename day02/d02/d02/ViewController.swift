//
//  ViewController.swift
//  d02
//
//  Created by Malebo MTHOMBENI on 2018/10/04.
//  Copyright © 2018 Malebo MTHOMBENI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var myTableView: UITableView!
    var passedData: String = ""
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DNData.deathNote.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "deathNote") as! deathNoteTableViewCell
        cell.deathNote = DNData.deathNote[indexPath.row]
        return cell
    }
    
    //@IBAction func unwind(_ sender)
    @IBAction func unwindToHome(_ sender: UIStoryboardSegue) {
        
    }
    
    func doAppend(n: (String, String, String)) {
        DNData.deathNote.append(n)
        myTableView.reloadData()
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

