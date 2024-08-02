//
//  CategoryViewModel.swift
//  IlaBankDemo
//
//  Created by Apple on 01/08/24.
//

import Foundation

protocol CategoryViewModelDelegate: AnyObject {
    func didFinishWithCategoryLoading()
    func didFailedWithCategoryLoading()
}

final class CategoryViewModel {
    var categories = [CategoriesListData]()
    private var filterItems = [Items]()
    var itemList: [Items] {
        return filterItems
    }
    
    private var selectedCategory: CategoriesListData?
    weak var delegate: CategoryViewModelDelegate?
     
    private var fileReader: FileReader
    
    init(fileReader: FileReader = FileReader()) {
        self.fileReader = fileReader
    }
    
    func loadData() {
        guard let categoryData = fileReader.decodeCategoryDataToJson(fileName: "CategoriesMockData") else {
            refreshList()
            return
        }
        categories = categoryData.categories
        selectedCategory = categories.first
        refreshList()
    }

    func searchText(_ searchText: String) {
        if searchText.isEmpty {
            refreshList(isSearching: true)
        } else {
            filterItems = selectedCategory?.items.filter { model in
                return model.name.lowercased().range(of: searchText.lowercased()) != nil
            } ?? []
            manageData(isSearching: true)
        }
    }
    
    func loadDataAsPerCategoryName(_ name: String) {
        selectedCategory = categories.filter({$0.name == name}).first
        refreshList()
    }
    
    func clearSearch(){
        refreshList()
    }
    
    private func refreshList(isSearching: Bool = false) {
        filterItems = selectedCategory?.items ?? []
        manageData(isSearching: isSearching)
    }
    
    private func manageData(isSearching: Bool = false) {
        if filterItems.isEmpty {
            if isSearching {
                delegate?.didFailedWithCategoryLoading()
            } else {
                delegate?.didFailedWithCategoryLoading()
            }
        } else {
            delegate?.didFinishWithCategoryLoading()
        }
    }
    
    private func topCharacters() -> [(Character, Int)] {
        let strings = itemList.map({ $0.name })
        
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
    
    func getStatistiCombinedStr() -> String {
        var statCombinedStr = "Items in the list - \(itemList.count) \n Top 3 characters - "
        for (index, data) in topCharacters().enumerated() {
            statCombinedStr += "\(data.0): \(data.1)" + (index == (topCharacters().count - 1) ? "" : ", ")
        }
        return statCombinedStr
    }
}
