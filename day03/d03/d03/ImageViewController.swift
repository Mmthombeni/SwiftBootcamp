//
//  ImageViewController.swift
//  d03
//
//  Created by Malebo MTHOMBENI on 2018/10/05.
//  Copyright © 2018 Malebo MTHOMBENI. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var _vC: UIScrollView!
    
    var imageUrl: String = ""
    var imageTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = imageTitle
        var iData: Data? = nil
        
        do {
            iData = try Data(contentsOf: URL(string: imageUrl)!)
            
            if iData != nil {
                self._vC.addSubview(UIImageView(image: UIImage(data: (iData)!)))
            }
            //print("D: " + ImageData.nasaImage[indexPath.row])
        }catch let err {
            print(" Error: \(err.localizedDescription)")
//            self.createAlert(title: "Error!!", message: "Cannot access to: " + err.localizedDescription)
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
