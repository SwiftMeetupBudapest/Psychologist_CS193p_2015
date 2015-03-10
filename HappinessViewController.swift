//
//  ViewController.swift
//  Happiness
//
//  Created by Géza Mikló on 04/03/15.
//  Copyright (c) 2015 Géza Mikló. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource {

    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "onPinched:"))
            faceView.addGestureRecognizer(UIRotationGestureRecognizer(target: faceView, action: "onRotate:"))
            faceView.dataSource = self
        }
    }
    
    var happiness : Int = 60 {
        didSet {
            happiness = min(max(happiness, 0), 100)
            println("happiness = \(happiness)")
            updateUI()
        }
    }
    
    func updateUI() {
        faceView?.setNeedsDisplay()
        title = "\(happiness)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: "onPan:"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onPan(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .Changed:
            happiness += Int(gesture.translationInView(view).y)
            gesture.setTranslation(CGPoint(x: 0,y: 0), inView: view)
        default:
            break
        }
    }

    func smilinessForFaceView(sender: FaceView) -> Double? {
        println("delegate method called")
        return Double(happiness - 50) / 100
    }

}

