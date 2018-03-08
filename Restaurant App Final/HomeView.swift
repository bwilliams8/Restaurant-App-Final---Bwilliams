//
//  ViewController.swift
//  Restaurant App Final
//
//  Created by Brian Williams
//  Copyright © 2018 Bwilliams8. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var continueButton: RoundButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.alpha = 0
        self.descLabel.alpha = 0
        self.continueButton.alpha = 0
        // Sets each of the non-background elements to be invisible at the start.

        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, animations: {
            self.titleLabel.alpha = 1
        }, completion: { (true) in
            UIView.animate(withDuration: 0.5, animations: {
                self.descLabel.alpha = 1
            }, completion: { (true) in
                UIView.animate(withDuration: 0.5, animations: {
                    self.continueButton.alpha = 1
                })
            })
        })
        // Animates the home screen elements in one-by-one. Serves no purpose other than to look nice.


        
    }



}

