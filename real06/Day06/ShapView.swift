//
//  Shapeview.swift
//  Day06
//
//  Created by Malebo MTHOMBENI on 2018/10/10.
//  Copyright © 2018 Malebo MTHOMBENI. All rights reserved.
//

import Foundation
import UIKit

class ShapeView : UIView
{
    var shapeSize: CGFloat = 100
    
    init(point: CGPoint, maxWidth: CGFloat, maxHeight: CGFloat)
    {
        var x = point.x
        var y = point.y
        
        //check that the shape doesn't go beyond the size of the view/screen
        if x + shapeSize/2 > maxWidth {
            x = x - shapeSize/2
        }
        if y + shapeSize/2 > maxHeight {
            y = y - shapeSize/2
        }
        
        //create a random shape between square & circle
        let randomNum = Int(arc4random_uniform(2))
        switch randomNum {
        case 0:
            //draw a square
            super.init(frame: CGRect(x: x, y: y, width: shapeSize, height: shapeSize))
        default:
            //draw a circle
            super.init(frame: CGRect(x: x, y: y, width: shapeSize, height: shapeSize))
            self.layer.cornerRadius = shapeSize / 2
        }
        
        self.backgroundColor = getRandomColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been used")
    }
    
    func  getRandomColor() -> UIColor
    {
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
}
