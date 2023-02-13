//
//  ProductsViewController.swift
//  02_01_2023_DispatchQueueDemo
//
//  Created by Vishal Jagtap on 13/02/23.
//

import UIKit

class ProductsViewController: UIViewController {
    var url : URL?
    var urlRequest : URLRequest?
    var session : URLSession?
    
    var products = [Product]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUsers()
    }
    
    func getUsers(){
        var urlString = "https://dummyjson.com/products"
        url = URL(string: urlString)
        
        urlRequest = URLRequest(url: url!)
        urlRequest?.httpMethod = "GET"
        
        session = URLSession(configuration: .default)
        
        var dataTask = session?.dataTask(with: urlRequest!) { data, res, error in
            
            print(data)
            print(res)
            print(error)
            
            //ProductsAPI
            let jsonObject = try! JSONSerialization.jsonObject(with: data!) as! [String : Any]
            
            let productsArray = jsonObject["products"] as! [[String : Any]]
            for eachProduct in productsArray{
                let productId = eachProduct["id"] as! Int
                let productTitle = eachProduct["title"] as! String
                let productRating = eachProduct["rating"] as! Double
                
                let newProduct = Product(id: productId, title: productTitle, rating: productRating)
                
                self.products.append(newProduct)
            }
            
            //Users API
            /*let jsonObject1 = try! JSONSerialization.jsonObject(with: data!) as! [String:Any]
            let page = jsonObject1["page"] as! Int
            let per_page = jsonObject1["per_page"] as! Int
            let total = jsonObject1["total"] as! Int
            let total_pages = jsonObject1["total_pages"] as! Int
            let data = jsonObject1["data"] as! [[String : Any]]
            for eachData in data{
                let id = eachData["id"] as! Int
                let email = eachData["email"] as! String
                let first_name = eachData["first_name"] as! String
                let last_name = eachData["last_name"] as! String
                let avatar = eachData["avatar"] as! String
            }*/
            
            /*DispatchQueue.main.async {
                self.productsTableView.reloadData()
            }*/
        }.resume()
    }
}
