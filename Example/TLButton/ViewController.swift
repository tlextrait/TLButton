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
    private var prButton: TLButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        // Interface Builder button
        //
        
        ibButton.on(event: .touchUpInside) {
            print("Tapped button 1")
        }
        
        //
        // Programmatic button
        //
        
        prButton = TLButton(title: "TLButton")
        prButton.backgroundColor = UIColor.clear
        prButton.borderColor = UIColor.red
        prButton.borderWidth = 1.0
        prButton.cornerRadius = 4.0
        prButton.setTitleColor(UIColor.red, for: .normal)
        prButton.on(event: .touchUpInside) {
            print("Tapped button 2")
        }
        prButton.center = view.center
        
        view.addSubview(prButton!)
    }

}

