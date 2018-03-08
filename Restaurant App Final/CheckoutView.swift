//
//  CheckoutView.swift
//  Restaurant App Final
//
//  Created by cyber on 3/8/18.
//  Copyright © 2018 Bwilliams8. All rights reserved.
//

import UIKit

class CheckoutView: UIViewController {

    
    @IBOutlet weak var itemOneLabel: UILabel!
    @IBOutlet weak var itemTwoLabel: UILabel!
    @IBOutlet weak var itemThreeLabel: UILabel!
    @IBOutlet weak var itemFourLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var itemOneCount: Int = 0
    var itemTwoCount: Int = 0
    var itemThreeCount: Int = 0
    var itemFourCount: Int = 0
    var price: Double = 0.00
    // Count of each item, fetched from the previous screen.
    
    let priceOne: Double = 9.00
    let priceTwo: Double = 10.00
    let priceThree: Double = 9.00
    let priceFour: Double = 3.00
    // The price of each purchasable item, normally would be fetched from the server
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        itemOneLabel.text = "\(itemOneCount)"
        itemTwoLabel.text = "\(itemTwoCount)"
        itemThreeLabel.text = "\(itemThreeCount)"
        itemFourLabel.text = "\(itemFourCount)"
        priceLabel.text = "$ \(price)"
        // Matches the labels to the correct numbers calculated from the previous screen.
    }

}
