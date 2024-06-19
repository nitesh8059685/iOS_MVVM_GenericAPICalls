//
//  AddProductViewController.swift
//  MVVMProductDemo
//
//  Created by Nitesh Sharma on 19/06/24.
//

import UIKit

class AddProductViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addProduct()
        // Do any additional setup after loading the view.
    }
    
//    NOTE: without generic way for post API calls
    func addProduct() {
        guard let url = URL(string: "https://dummyjson.com/products/add") else { return }
        let perameters = AddProduct(title: "Nitesh Sharma")

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
//        Model to data using JDONEncoder and Encodable
        request.httpBody = try? JSONEncoder().encode(perameters)
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json"
        ]
        URLSession.shared.dataTask(with: request) { data, response,
            error in
            guard let data else { return }
            do{
//        Data to Model using JDONDecoder and Decodable
                let productResponse = try
                JSONDecoder().decode(AddProduct.self, from: data)
                print(productResponse)
            }catch{
                print(error)
            }
        }.resume()
        
    }
    
}
