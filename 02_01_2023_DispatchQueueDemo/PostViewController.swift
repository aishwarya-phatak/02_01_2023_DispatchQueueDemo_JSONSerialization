//
//  PostViewController.swift
//  02_01_2023_DispatchQueueDemo
//
//  Created by Vishal Jagtap on 08/02/23.
//

import UIKit

class PostViewController: UIViewController {

    var posts = [Post]()
    override func viewDidLoad() {
        super.viewDidLoad()

        let urlString = "https://jsonplaceholder.typicode.com/posts"
        let url = URL(string: urlString)
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        var session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: request) { data, response, error in
          
            var getJSONObject = try JSONSerialization.jsonObject(with: data!) as! [[String : Any]]
            
            
            for dictionary in getJSONObject{
                let eachDictionary = dictionary as [String : Any]
            }
        }
        dataTask.resume()
    }
    
    /*var dict : [String : Any] = ["One" : 1,
                "Two" : "two",
                "Three" : 3]*/
    
}
