//
//  ViewController.swift
//  StampPhoneScreen1
//
//  Created by Larry Bulen on 7/25/19.
//  Copyright © 2019 Larry Bulen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var stampButtons: [UIButton]!
    private var selectedColor: UIColor = .black
    
    @IBAction func stampTapped(_ sender: UIButton) {
        guard let stampColor = sender.backgroundColor else {
            return
        }
        
        self.selectedColor = stampColor
        self.updateButtonColors(selectedButton: sender)
    }
    
    private func updateButtonColors(selectedButton: UIButton) {
        self.stampButtons.forEach { $0.alpha = 1.0 }
        selectedButton.alpha = 0.5
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan")
        for touch in touches {
            print("x: \(touch.location(in: self.view).x) y: \(touch.location(in: self.view).y)")
            let square: UIView = UIView.init()
            square.frame.size.height = 50
            square.frame.size.width = 50
            square.center = CGPoint(x: touch.location(in: self.view).x, y: touch.location(in: self.view).y)
            square.backgroundColor = selectedColor
            self.view.addSubview(square)
            
        }
    }
}
