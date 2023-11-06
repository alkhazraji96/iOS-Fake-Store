//
//  Product.swift
//  FakeStore
//
//  Created by Ameer Alkhazraji on 11/6/23.
//

import Foundation

struct Product: Decodable {
    let id: Int
    let title: String
    let category: String
    let price: Float
    let description: String
    let rating: Rating
    let image: String
}
