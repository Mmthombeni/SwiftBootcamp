//
//  ViewController.swift
//  d06
//
//  Created by Malebo MTHOMBENI on 2018/10/10.
//  Copyright © 2018 Malebo MTHOMBENI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//    var x = 0
//    var y = 0
    var animator = UIDynamicAnimator()
    let direction = CGVector.init(dx: 0, dy: 0.5)
    let gravity = UIGravityBehavior.init()
    let collision = UICollisionBehavior.init()
    let dynBehavior = UIDynamicItemBehavior.init()
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        print("its up")
//        let firstV:FirstViewController = (tabBarController?.viewControllers![0] as? FirstViewController)!
//        let rect = CGRect(x: 50, y: 50, width: 100, height: 100)
//
//        let shapes: UIView = ShapeView(frame: rect)
//
//        self.view.addSubview(shapes)
        
        
        
        let location = sender.location(in: view)
        let rect = CGRect(x: (location.x - 50), y: (location.y - 50), width: 100, height: 100)
        let shape = ShapeView(frame: rect)
        
         self.addBehavior(v: shape)
        self.view.addSubview(shape)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(gesture:)))
        view.addGestureRecognizer(gesture)
        self.animator = UIDynamicAnimator(referenceView: self.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addBehavior(v: UIView) {
        
        self.gravity.magnitude = 100
        self.gravity.addItem(v)
        self.gravity.gravityDirection = direction
        
        self.collision.addItem(v)
        self.collision.translatesReferenceBoundsIntoBoundary = true

        self.dynBehavior.elasticity = 1
        self.dynBehavior.addItem(v)

//        self.animator.addBehavior(self.gravity)
        self.animator.addBehavior(self.dynBehavior)
//        self.animator.addBehavior(self.collision)
    }
    
    @objc func panGesture(gesture: UIPanGestureRecognizer) {
        _ = gesture.translation(in: self.view)
        
        switch gesture.state {
        case .began:
            break
        case .ended:
            break
        case .changed:
            print("loc: ", gesture.location(in: view))
            break
        default:
            break
        }
    }

}

