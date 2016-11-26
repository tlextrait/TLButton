//
//  ViewController.swift
//  TLButton
//
//  Created by Thomas Lextrait on 11/25/2016.
//  Copyright (c) 2016 Thomas Lextrait. All rights reserved.
//

import UIKit
import TLButton

class HomeController: UIViewController {
    
    // Button created in Interface Builder
    @IBOutlet weak var ibButton: TLButton!
    
    // Button created programmatically
    private var prButton: TLButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ibButton.onTouch {
            print("Tapped button 1")
        }
        
        prButton = TLButton(frame: CGRect(x: 20, y: 200, width: 200, height: 15))
        prButton?.setTitle("TLButton", for: .normal)
        prButton?.onTouch {
            print("Tapped button 2")
        }
        
        view.addSubview(prButton!)
    }

}

