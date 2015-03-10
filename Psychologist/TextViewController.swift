//
//  TextViewController.swift
//  Psychologist
//
//  Created by Géza Mikló on 10/03/15.
//  Copyright (c) 2015 Géza Mikló. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {

    
    @IBOutlet weak var textView: UITextView! {
        didSet {
            textView.text = text
        }
    }
    
    var text: String = ""{
        didSet {
            textView?.text = text
        }
    }
    
    override var preferredContentSize: CGSize {
        get {
            if textView != nil && presentingViewController != nil {
                return textView.sizeThatFits(presentingViewController!.view.bounds.size)
            }
            return super.preferredContentSize
        }
        set {
            super.preferredContentSize = newValue
        }
    }

}
