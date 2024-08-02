//
//  ItemTableCell.swift
//  IOS_Demo_UIKit
//
//  Created by Apple on 01/08/24.
//

import UIKit

class ItemTableCell: UITableViewCell {
    
    //MARK: IBOutlets
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var shadowView: UIView!
    
    static let identifier = "ItemTableCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    private func setupUI() {
        nameLbl.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        descLbl.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        shadowView.addShadow()
        imgView.layer.cornerRadius = 5
        shadowView.layer.cornerRadius = 5
        shadowView.layer.masksToBounds = false
    }
    
    func setupData(item: Items) {
        nameLbl.text = item.name
        descLbl.text = item.description
        if let image = UIImage(named: item.name) {
            imgView.image = image
        }
    }
}

