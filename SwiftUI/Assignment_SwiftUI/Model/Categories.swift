//
//  Categories.swift
//  Carousel-SwiftUI
//
//  Created by Apple on 01/08/24.
//

import Foundation

struct Categories: Decodable {
    var categories: [CategoriesListData]
}

struct CategoriesListData: Decodable {
    var name: String
    var items: [Items]
}

struct Items: Decodable {
    var name: String
    var imageLink: String
    var description: String
}
