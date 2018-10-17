//
//  ViewController.swift
//  Day06
//
//  Created by Malebo MTHOMBENI on 2018/10/10.
//  Copyright © 2018 Malebo MTHOMBENI. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var squareview : UIView!
    var animator : UIDynamicAnimator!
    var gravity : UIGravityBehavior!
    var collision: UICollisionBehavior!
    var dynBehavior : UIDynamicItemBehavior!
    @IBOutlet weak var viewDrag : UIView!
    var panGesture = UIPanGestureRecognizer()
    
    
    @IBAction func tab(_ sender: UITapGestureRecognizer)
    {
        let shapeView = ShapeView(point: sender.location(in: view), maxWidth: self.view.bounds.width, maxHeight: self.view.bounds.height)
        self.view.addSubview(shapeView)
        collision.addItem(shapeView)
        gravity.addItem(shapeView)
        dynBehavior.addItem(shapeView)
        
        
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        animator = UIDynamicAnimator(referenceView: self.view)
        gravity = UIGravityBehavior(items: [])
        animator.addBehavior(gravity)
        
        collision = UICollisionBehavior(items: [])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        dynBehavior = UIDynamicItemBehavior(items: [])
        dynBehavior.elasticity = 0.6
        animator.addBehavior(dynBehavior)
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

