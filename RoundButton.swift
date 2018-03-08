//
//  RoundButton.swift
//  Brian Williams Individual App
//
//  Created by Brian Williams
//  Copyright © 2018 ISYS 230. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
}


//The purpose of this file is to create a new UIButton class, which is more customizable than default. Three IBInspectable values allow me to change the corner radius, and then add a border if i wish. 
