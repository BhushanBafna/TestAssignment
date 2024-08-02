//
//  HeaderTableCell.swift
//  IOS_Demo_UIKit
//
//  Created by Apple on 01/08/24.
//

import UIKit

protocol HeaderTableCellDelegate: AnyObject {
    func categoryDidChanged(category: CategoriesListData)
}

class HeaderTableCell: UITableViewCell {
    
    //MARK: IBOutlets
    @IBOutlet weak var carouselCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    static let identifier = "HeaderTableCell"
    private var categories = [CategoriesListData]()
    weak var delegate: HeaderTableCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupCollectionView()
        setupPageControl()
    }
    
    private func setupCollectionView() {
        carouselCollectionView.register(UINib(nibName: CarouselCollectionCell.identifier, bundle: nil), forCellWithReuseIdentifier: CarouselCollectionCell.identifier)
        provideLayoutToCollectionView()
    }
    
    //MARK: Setup collection view flow layout
    private func provideLayoutToCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: width, height: 200)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        carouselCollectionView.collectionViewLayout = layout
    }
    
    func setupData(categories: [CategoriesListData]) {
        self.categories = categories
        pageControl.numberOfPages = categories.count
    }
    
    private func setupPageControl() {
        pageControl.pageIndicatorTintColor = .gray
        pageControl.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        pageControl.currentPageIndicatorTintColor = .systemPink
    }
}

//MARK: Collection vieew datasource & delegate
extension HeaderTableCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCollectionCell.identifier, for: indexPath) as? CarouselCollectionCell
        cell?.setData(headerImgStr: categories[indexPath.item].name)
        return cell ?? UICollectionViewCell()
    }
}

//MARK: UIScrollViewDelegate
extension HeaderTableCell {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let _ = scrollView as? UICollectionView {
            let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
            self.pageControl.currentPage = page
            guard let delegate = delegate else { return }
            delegate.categoryDidChanged(category: categories[page])
        }
    }
}
