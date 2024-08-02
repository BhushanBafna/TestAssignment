//
//  BundleDecoder.swift
//  Assignment_SwiftUI
//
//  Created by Apple on 01/08/24.
//

import Foundation

struct FileReader {
    func decodeCategoryDataToJson(fileName: String) -> Categories? {
        if let json = Bundle.main.path(forResource: fileName, ofType: "json") {
            if let categories = try? Data(contentsOf: URL(fileURLWithPath: json), options: .alwaysMapped) {
                return try? JSONDecoder().decode(Categories.self, from: categories)
            }
        }
        return nil
    }
}
