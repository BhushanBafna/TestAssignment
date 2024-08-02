//
//  CategoryViewController.swift
//  IlaBankDemo
//
//  Created by Apple on 01/08/24.
//

import UIKit

class CategoryViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var floatingBtn: UIButton!
    
    let viewModel = CategoryViewModel()
    lazy var searchBar: UISearchBar = UISearchBar()
    private var isAnimationInProgress = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        setupTblView()
        fetchData()
        setupSearchBar()
        setupFloatingButton()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    private func fetchData() {
        viewModel.loadData()
    }
    
    func reloadTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private func setupTblView() {
        tableView.register(UINib(nibName: HeaderTableCell.identifier, bundle: nil), forCellReuseIdentifier: HeaderTableCell.identifier)
        tableView.register(UINib(nibName: ItemTableCell.identifier, bundle: nil), forCellReuseIdentifier: ItemTableCell.identifier)
        tableView.estimatedRowHeight = 80
        tableView.separatorInset = .zero
    }
    
    private func setupSearchBar() {
        searchBar.placeholder = StringConstants.searchPlaceholder
        searchBar.sizeToFit()
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        }
        searchBar.delegate = self
        searchBar.searchTextField.delegate = self
    }
    
    private func setupFloatingButton() {
        floatingBtn.layer.cornerRadius = floatingBtn.frame.height / 2
        floatingBtn.addShadow()
    }
    
    @IBAction func floatingBtnTapped(_ sender: UIButton) {
        let vc = StatisticsViewController.loadFromNib()
        vc.statisticsCombinedStr = viewModel.getStatistiCombinedStr()
        vc.modalPresentationStyle = .overCurrentContext
        navigationController?.present(vc, animated: true)
    }
}

//MARK: Text field deleagte
extension CategoryViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchBar.resignFirstResponder()
    }
}

extension CategoryViewController: CategoryViewModelDelegate {
    func didFinishWithCategoryLoading() {
        reloadTable()
    }
    
    func didFailedWithCategoryLoading() {
        reloadTable()
    }
}
