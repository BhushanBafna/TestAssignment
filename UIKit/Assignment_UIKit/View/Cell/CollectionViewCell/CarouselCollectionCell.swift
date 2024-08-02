//
//  CarouselCollectionCell.swift
//  IlaBankDemo
//
//  Created by Apple on 01/08/24.
//

import UIKit

class CarouselCollectionCell: UICollectionViewCell {
    
    //MARK: IBOutlets
    @IBOutlet weak var imgView: UIImageView!
    static let identifier = "CarouselCollectionCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    private func setupUI() {
        imgView.layer.cornerRadius = 8
        imgView.layer.masksToBounds = true
    }
    
    func setData(headerImgStr: String) {
        if let image = UIImage(named: headerImgStr) {
            imgView.image = image
        }
    }
}
