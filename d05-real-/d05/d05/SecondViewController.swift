//
//  SecondViewController.swift
//  d05
//
//  Created by Malebo MTHOMBENI on 2018/10/08.
//  Copyright © 2018 Malebo MTHOMBENI. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeData.placeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "placeName")
        cell.textLabel?.text = placeData.placeList[indexPath.row].0
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tabBarController?.selectedIndex = 0
        let firstV:FirstViewController = (tabBarController?.viewControllers![0] as? FirstViewController)!
        
        firstV.go(position: placeData.placeList[indexPath.row].2)
    }

}

