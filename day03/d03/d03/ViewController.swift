//
//  ViewController.swift
//  d03
//
//  Created by Malebo MTHOMBENI on 2018/10/05.
//  Copyright © 2018 Malebo MTHOMBENI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var myCollect: UICollectionView!
    //number of views
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ImageData.nasaImage.count
    }
    
    //populate views
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "nasaImage", for: indexPath) as! imageCollectionViewCell
        
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator.center = cell.myImage.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        cell.myImage.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        if let url = URL(string: ImageData.nasaImage[indexPath.row]){
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            let trd = DispatchQueue.global(qos: .background)
            trd.async {
                var iData: Data? = nil
                
                do {
                    iData = try Data(contentsOf: url)
                    //print("D: " + ImageData.nasaImage[indexPath.row])
                }catch let err {
                    print(" Error: \(err.localizedDescription)")
                    self.createAlert(title: "Error!!", message: "Cannot access to: " + err.localizedDescription)
                }
                
                DispatchQueue.main.async {
                    if iData != nil {
                        cell.myImage.image = UIImage(data: (iData)!)
                    }
                    activityIndicator.stopAnimating()
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            }
        }
        return cell
    }
    
    func createAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(action) in alert.dismiss(animated:true, completion: nil)}))
        self.present(alert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let v: ImageViewController = segue.destination as! ImageViewController
        
        if let index = myCollect.indexPathsForSelectedItems?.first?.item {
            v.imageTitle = "Image title Here"
            v.imageUrl = ImageData.nasaImage[index]
        }
    }
}

