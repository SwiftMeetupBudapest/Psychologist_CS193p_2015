//
//  DiagnosedHappinessViewController.swift
//  Psychologist
//
//  Created by Géza Mikló on 10/03/15.
//  Copyright (c) 2015 Géza Mikló. All rights reserved.
//

import UIKit

class DiagnosedHappinessViewController: HappinessViewController, UIPopoverPresentationControllerDelegate {

    
    override var happiness: Int {
        didSet {
            diagnosticHistory += [happiness]
        }
    }
    
    private struct History {
        static let DefaultsKey = "HappinessViewController.history"
        static let SegueIdentifier = "Show History"
    }
    
    // To store defaults
    let defaults = NSUserDefaults.standardUserDefaults()
    
    var diagnosticHistory : [Int] {
        get {
            return defaults.objectForKey(History.DefaultsKey) as? [Int] ?? []
        }
        set {
            defaults.setObject(newValue, forKey: History.DefaultsKey)
        }
    }
    
        
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("Segue")
        if let identifier = segue.identifier {
            println(identifier)
            switch identifier {
            case History.SegueIdentifier:
                println("Show history \(diagnosticHistory)")
                if let tvc = segue.destinationViewController as? TextViewController {
                    println("Got tvc");
                    
                    if let ppc = tvc.popoverPresentationController {
                        ppc.delegate = self
                    }
                    
                    tvc.text = "\(diagnosticHistory)"
                }
            default: break
            }
        }
    }

    // Do not adapt on iphone - remains popover "bubble"
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
}
