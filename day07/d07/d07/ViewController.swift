//
//  ViewController.swift
//  d07
//
//  Created by Malebo MTHOMBENI on 2018/10/11.
//  Copyright © 2018 Malebo MTHOMBENI. All rights reserved.
//

import UIKit
import RecastAI
import ForecastIO

class ViewController: UIViewController {
    private var client: DarkSkyClient?
    private var bot: RecastAIClient?
    @IBOutlet weak var ResponseLabel: UILabel!
    @IBOutlet weak var RequestField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.bot = RecastAIClient(token: "f0483297e258b22b75a74db20c1bbd12")
        self.client = DarkSkyClient(apiKey: "36e8c3e9d493e5f641d647d8554fa9e9")
//        self.makeRequest(Requetstr: "Pretoria")
    }
    @IBAction func RequestButton(_ sender: UIButton) {
        makeRequest(Requetstr: RequestField.text!)
    }
    
    /**
     Make text request to Recast.AI API
     */
    func makeRequest(Requetstr: String)
    {
        //Call makeRequest with string parameter to make a text request
        self.bot?.textRequest(Requetstr,successHandler: AcceptRes, failureHandle: receiveErr)
    }
    
    func AcceptRes(res: Response) {
        print("Response things")
        if let location = res.get(entity: "location"){
            makeForcast(lat: location["lat"] as! Double, lng: location["lng"] as! Double)
        }else{
            ResponseLabel.text! = "Error"
        }
    }
    
    func receiveErr(err: Error){
        print("Error")
    }
    
    func makeForcast(lat: Double, lng: Double) {
        self.client?.getForecast(latitude: lat, longitude: lng, time: Date(), completion: {rs in switch rs{
        case .success(let value, _):
            let weather = value.currently!.summary!

            print("lol:", weather)
            self.ResponseLabel.text! = weather
            break
        case .failure(let err):
            self.ResponseLabel.text! = "Error"
            break
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

