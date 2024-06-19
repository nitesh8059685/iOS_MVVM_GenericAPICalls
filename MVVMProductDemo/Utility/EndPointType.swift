//
//  EndPointType.swift
//  MVVMProductDemo
//
//  Created by Nitesh Sharma on 17/06/24.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "Delete"
}

protocol EndPointType {
    var path: String { get }
    var baseURL: String { get }
    var url: URL? { get }
    var method: HTTPMethods { get }
}

// this is the enum for all the modules in the system

enum EndPointItems {
    case products     //module
    case A    //Example module
    case B    //Example module
    case C    //Example module
}

//  https://fakestoreapi.com/products


extension EndPointItems : EndPointType {
    var path: String {
        switch self {
        case .products:
            return "products"
        case .A:
            return "A"
        case .B:
            return "B"
        case .C:
            return "C"
        }
    }
    
    var baseURL: String {
        return "https://fakestoreapi.com/"
    }
    
    var url: URL? {
        return URL(string: "\(baseURL)\(path)")
    }
    
    var method: HTTPMethods {
        switch self {
        case .products:
            return .get
            
        case .A:
            return .post
        case .B:
            return .put
        case .C:
            return .delete
        }
    }
    
    
}
