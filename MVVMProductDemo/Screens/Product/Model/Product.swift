//
//  Product.swift
//  MVVMProductDemo
//
//  Created by Nitesh Sharma on 13/06/24.
//

import Foundation

struct Product: Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rate
//    for Dictonary it is Rate and for array we should write [Rate] like this
}

struct Rate: Codable {
    let rate: Double
    let count: Int
}
