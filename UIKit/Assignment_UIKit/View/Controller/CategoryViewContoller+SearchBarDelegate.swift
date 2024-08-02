//
//  ViewContoller+SearchBarDelegate.swift
//  IOS_Demo_UIKit
//
//  Created by Apple on 01/08/24.
//

import UIKit

//MARK: Search bar delegate
extension CategoryViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchText(searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
