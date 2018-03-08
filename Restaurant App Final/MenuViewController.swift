//
//  MenuViewController.swift
//  Restaurant App Final
//
//  Created by Brian Williams
//  Copyright © 2018 Bwilliams8. All rights reserved.
//

import UIKit
import Foundation

//extension URL {
//    func withQueries(_ queries: [String: String]) -> URL? {
//        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
//        components?.queryItems = queries.flatMap {
//            URLQueryItem(name: $0.0, value: $0.1) }
 //       return components?.url
//    }
//}





class MenuViewController: UIViewController {
    

    
    @IBOutlet weak var itemOneCount: UILabel!
    @IBOutlet weak var itemTwoCount: UILabel!
    @IBOutlet weak var itemThreeCount: UILabel!
    @IBOutlet weak var itemFourCount: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    let priceOne: Double = 9.00
    let priceTwo: Double = 10.00
    let priceThree: Double = 9.00
    let priceFour: Double = 3.00
        // The price of each purchasable item, normally would be fetched from the server
    
    var oneSelected: Int = 0 {
        didSet {
            updateOrder()
        }
    }
    
    var twoSelected: Int = 0 {
        didSet {
            updateOrder()
        }
    }
    
    var threeSelected: Int = 0 {
        didSet {
            updateOrder()
        }
    }
    
    var fourSelected: Int = 0 {
        didSet {
            updateOrder()
        }
    }
    // A property observer for each purchasable item, runs the updateOrder() function when each value is changed.
    
    @IBAction func oneAdd(_ sender: Any) {
        oneSelected += 1
    }
    @IBAction func oneRemove(_ sender: Any) {
        if oneSelected != 0 {
            oneSelected -= 1
        }
    }
    
    @IBAction func twoAdd(_ sender: Any) {
        twoSelected += 1
    }
    @IBAction func twoRemove(_ sender: Any) {
        if twoSelected != 0 {
            twoSelected -= 1
        }
    }
    
    @IBAction func threeAdd(_ sender: Any) {
        threeSelected += 1
    }
    @IBAction func threeRemove(_ sender: Any) {
        if threeSelected != 0 {
            threeSelected -= 1
        }
    }
    
    @IBAction func fourAdd(_ sender: Any) {
        fourSelected += 1
    }
    @IBAction func fourRemove(_ sender: Any) {
        if fourSelected != 0 {
            fourSelected -= 1
        }
    }
        //Functionality for each add/remove button. Prevents quantity from going negative by ensuring remove function can only be performed >0.
    
    
    func updateOrder() {
        itemOneCount.text = String(oneSelected)
        itemTwoCount.text = String(twoSelected)
        itemThreeCount.text = String(threeSelected)
        itemFourCount.text = String(fourSelected)
        totalPriceLabel.text = String( (Double(oneSelected) * priceOne) + (Double(twoSelected) * priceTwo) + (Double(threeSelected) * priceThree) + (Double(fourSelected) * priceFour))
    }
    
    // This function is called any time a value changes. It updates the label's text to match the value of the variable. It could also be done individually, but since we aren't working with a ton of numbers it's simpler to do it en masse.
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchMenuItems { (fetchedItems) in
            print(fetchedItems)
        }
        
    }
    
    let url = URL(string: "http://127.0.0.1:8090/menu.json")
    let urlString = "http://127.0.0.1:8090/menu.json"
    
    struct MenuItem {
        var id: Int
        var name: String
        var description: String
        var price: Double
        var category: String
        var imageName: String
        
        
        init?(json: [String: Any]) {
            guard let id = json["id"] as? Int,
                let name = json["name"] as? String,
                let description = json["description"] as? String,
                let price = json["price"] as? Double,
                let category = json["category"] as? String,
                let imageName = json["imageName"] as? String else { return nil}
            self.id = id
            self.name = name
            self.description = description
            self.price = price
            self.category = category
            self.imageName = imageName
        }
        
    }
    
//The server is being incredibly difficult (Saw the announcement, couldn't get it to work even with local ip.) so I can't pinpoint what would allow the menu.json file to be picked up. It would either be root/menu.json, root/Restaurant/menu.json, or the enclosing folder would need to be placed in root/Restaurant%20App%20Final/.
    
    func fetchMenuItems(completion: @escaping (MenuItem?) -> Void) {
        let url = URL(string: "http://127.0.0.1:8090/menu.json")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data,
                let rawJSON = try? JSONSerialization.jsonObject(with: data),
                let json = rawJSON as? [String: String],
                let menuItem = MenuItem(json: json) {
                
                completion(menuItem)
            } else {
                print("Either no data was returned, or data was not serialized.")
                completion(nil)
            }
        }
        
        task.resume()
        
        //Here is the function to fetch the json which I could not for the life of me get to work, even with a non-locally hosted URL. I made the rest of the app function pretty much exactly the same as last class's final aside from that, since had i attempted to code blind, it probably would have been messy. I expect to get points off for not utilizing json properly.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondScreen = segue.destination as! CheckoutView
        let totalPriceNumber:Double = ( (Double(oneSelected) * priceOne) + (Double(twoSelected) * priceTwo) + (Double(threeSelected) * priceThree) + (Double(fourSelected) * priceFour))
        secondScreen.itemOneCount = oneSelected
        secondScreen.itemTwoCount = twoSelected
        secondScreen.itemThreeCount = threeSelected
        secondScreen.itemFourCount = fourSelected
        secondScreen.price = totalPriceNumber
        //Sends information to the checkout screen so to display correct numbers
    }
    
    

    
    

}
