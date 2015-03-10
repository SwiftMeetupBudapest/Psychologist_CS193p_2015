//
//  ViewController.swift
//  Psychologist
//
//  Created by Géza Mikló on 10/03/15.
//  Copyright (c) 2015 Géza Mikló. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController as? UIViewController
        
        if let navCon = destination as? UINavigationController {
            destination = navCon.visibleViewController
        }
        
        if let hvc = destination as? HappinessViewController {
            if let identifier = segue.identifier {
                switch identifier {
                    case "Sad":
                        hvc.happiness = 0
                    case "Meh":
                        hvc.happiness = 60
                    case "Happy":
                        hvc.happiness = 100
                    case "nothing":
                        hvc.happiness = 25
                    default: hvc.happiness = 50
                }
            }
        }
    }

    @IBAction func nothing(sender: UIButton) {
        performSegueWithIdentifier("nothing", sender: nil)
    }

}

