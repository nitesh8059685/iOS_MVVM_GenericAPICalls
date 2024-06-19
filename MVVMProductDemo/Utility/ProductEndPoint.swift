//
//  ProductEndPoint.swift
//  MVVMProductDemo
//
//  Created by Nitesh Sharma on 19/06/24.
//

import Foundation

// this is the enum for all the modules in the system

enum ProductEndPoint {
    case products     //module
    case addProduct(product: AddProduct)   //module
    case B    //Example module
    case C    //Example module
}

// FOR GET PRODUCTS https://fakestoreapi.com/products
// FOR ADD PRODUCTS https://dummyjson.com/products/add

extension ProductEndPoint : EndPointType {
  
    var path: String {
        switch self {
        case .products:
            return "products"
        case .addProduct:
            return "products/add"
        case .B:
            return "B"
        case .C:
            return "C"
        }
    }
    
    var baseURL: String {
        switch self{
        case .products:
            return "https://fakestoreapi.com/"
        case .addProduct:
            return "https://dummyjson.com/"
        case .B:
            return ""
        case .C:
            return ""
        }
    }
    
    var url: URL? {
        return URL(string: "\(baseURL)\(path)")
    }
    
    var method: HTTPMethods {
        switch self {
        case .products:
            return .get
        case .addProduct:
            return .post
        case .B:
            return .put
        case .C:
            return .delete
        }
    }
    
    var body: Encodable? {
        switch self {
        case .products:
            return nil
        case .addProduct(let product):
            return product
        case .B:
            return ""
        case .C:
            return ""
        }
    }
    
    var headers: [String : String]? {
       APIManager.commonHeader
    }
    
}
