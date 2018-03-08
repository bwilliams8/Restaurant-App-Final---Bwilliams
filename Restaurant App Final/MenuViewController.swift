//
//  MenuViewController.swift
//  Restaurant App Final
//
//  Created by cyber on 3/6/18.
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
    }
    
    

    
    

}
