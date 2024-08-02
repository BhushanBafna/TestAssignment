//
//  ViewController+TableViewDatasource.swift
//  IlaBankDemo
//
//  Created by Apple on 01/08/24.
//

import UIKit

//MARK: Table view datasource & delegate
extension CategoryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return viewModel.itemList.isEmpty ? 1 : viewModel.itemList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            //For Carousel
            let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableCell.identifier, for: indexPath) as? HeaderTableCell
            cell?.setupData(categories: viewModel.categories)
            cell?.delegate = self
            return cell ?? UITableViewCell()
            
        } else if !viewModel.itemList.isEmpty &&
                    viewModel.itemList.count > indexPath.row {
            //For item list
            let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableCell.identifier) as? ItemTableCell
            
            let cellData = viewModel.itemList[indexPath.row]
            cell?.setupData(item: cellData)
            return cell ?? UITableViewCell()
        }
        
        //MARK: show no data cell
        let defaultCell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        defaultCell.separatorInset = .zero
        defaultCell.selectionStyle = .none
        defaultCell.textLabel?.textAlignment = .center
        defaultCell.textLabel?.text = StringConstants.noDataFound
        return defaultCell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 50
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            return searchBar
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 220
        }
        return UITableView.automaticDimension
    }
}

extension CategoryViewController: HeaderTableCellDelegate {
    func categoryDidChanged(category: CategoriesListData) {
        //Clear the seach text on category change
        searchBar.text?.removeAll()
        //Update the category data
        viewModel.loadDataAsPerCategoryName(category.name)
    }
}
