//
//  PostViewController.swift
//  02_01_2023_DispatchQueueDemo
//
//  Created by Vishal Jagtap on 08/02/23.
//

import UIKit

class PostViewController: UIViewController {

    @IBOutlet weak var postTableView: UITableView!
    var posts = [Post]()
    override func viewDidLoad() {
        super.viewDidLoad()

        let urlString = "https://jsonplaceholder.typicode.com/posts"
        let url = URL(string: urlString)
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        var session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: request) { data, response, error in
          
            print("Data --- \(data)")
            print("Response --- \(response)")
            print("Error --- \(error)")
            
            //way 1
            var getJSONObject = try! JSONSerialization.jsonObject(with: data!) as! [[String : Any]]
            
            for dictionary in getJSONObject{
                let eachDictionary = dictionary as [String : Any]
                let postId = eachDictionary["id"] as! Int
                let postTitle = eachDictionary["title"] as! String
                let postBody = eachDictionary["body"] as! String
                
                let newPostObject = Post(id: postId, title: postTitle, body: postBody)
                
                self.posts.append(newPostObject)
            }
            
            //way 2
           /* guard let jsonObject = try? JSONSerialization.jsonObject(with: data!) as? [[String : Any]] else { return }
            for jObject in jsonObject{
                
                
            }*/
            
            /*way 3
             do{
                let jsonObject1 = try JSONSerialization.jsonObject(with: data!) as! [[String : Any]]
            }catch{
                print(error)
            }*/
            
            DispatchQueue.main.async {
                self.postTableView.reloadData()
            }
        }
        dataTask.resume()
    }
    
    /*var dict : [String : Any] = ["One" : 1,
                "Two" : "two",
                "Three" : 3]*/
    
}

//task - bind data to cell labels on table view 
