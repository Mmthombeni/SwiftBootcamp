//
//  ShapeView.swift
//  d06
//
//  Created by Malebo MTHOMBENI on 2018/10/10.
//  Copyright © 2018 Malebo MTHOMBENI. All rights reserved.
//

import UIKit
import Foundation

class ShapeView: UIView {
    
    var path: UIBezierPath!
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    */
    override func draw(_ rect: CGRect) {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            self.createSquare()
        }
        else{
            self.path = UIBezierPath(ovalIn: CGRect(x: self.frame.size.width/2 - self.frame.size.height/2, y: 0.0, width: self.frame.size.height, height: self.frame.height))
        }
    
        getRandomColor().setFill()
        path.fill()
        
//        UIColor.purple.setStroke()
//        path.stroke()
    }
    
    func createSquare() {
        path = UIBezierPath()
        
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0.0))
    }
    
    func getRandomColor() -> UIColor {
        //Generate between 0 to 1
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
}
