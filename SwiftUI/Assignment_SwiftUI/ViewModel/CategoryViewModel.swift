//
//  CategoryViewModel.swift
//  Carousel-SwiftUI
//
//  Created by Apple on 01/08/24.
//

import Foundation

final class CategoryViewModel: ObservableObject  {
    @Published var categories = [CategoriesListData]()
    @Published var itemList = [Items]()
    @Published var filteredItemList = [Items]()
    @Published var selectedCategoryIndex = 0
    @Published var navigationTitle = ""
    
    private var fileReader: FileReader
    
    init(fileReader: FileReader = FileReader()) {
        self.fileReader = fileReader
    }
    
    func loadData() {
        guard let categoryData = fileReader.decodeCategoryDataToJson(fileName: "CategoriesMockData") else {
            return
        }
        categories = categoryData.categories
        filteredItemList = categories.first?.items ?? []
        navigationTitle = categories.first?.name ?? ""
    }

    func filterItem(for searchedText: String) {
        filteredItemList.removeAll()
        if searchedText.isEmpty {
            filteredItemList = categories[selectedCategoryIndex].items
        } else {
            filteredItemList = categories[selectedCategoryIndex].items.filter { $0.name.localizedCaseInsensitiveContains( searchedText) }
        }
    }
    
    func loadDataAsPerCategory() {
        if categories.count > selectedCategoryIndex {
            let selectedCategory = categories[selectedCategoryIndex]
            filteredItemList = selectedCategory.items
            navigationTitle = selectedCategory.name
        }
    }
    
    func topCharacters() -> [(Character, Int)] {
        let strings = filteredItemList.map({ $0.name })
        
        // Flatten the array of strings into a single string
        let combinedString = strings.joined()
        
        // Create a dictionary to count occurrences of each character
        var charCount = [Character: Int]()
        for char in combinedString {
            charCount[char, default: 0] += 1
        }
        
        // Sort the dictionary by values in descending order and get the top characters
        let sortedCharCount = charCount.sorted { $0.value > $1.value }
        
        // Get the top 3 characters
        let topCharacters = Array(sortedCharCount.prefix(3))
        
        return topCharacters
    }
}
