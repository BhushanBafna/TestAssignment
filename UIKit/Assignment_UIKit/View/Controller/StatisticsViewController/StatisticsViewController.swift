//
//  StatisticsViewController.swift
//  IOS_Demo_UIKit
//
//  Created by Apple on 01/08/24.
//

import UIKit

class StatisticsViewController: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subtitleLbl: UILabel!
    @IBOutlet weak var cancelBtn: UIButton!
    
    var statisticsCombinedStr: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        setupData()
    }
    
    static func loadFromNib() -> StatisticsViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let statisticsViewController = storyboard.instantiateViewController(withIdentifier: "StatisticsViewController") as! StatisticsViewController
        return statisticsViewController
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.isOpaque = false
        
        titleLbl.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        subtitleLbl.font = UIFont.systemFont(ofSize: 16)
        cancelBtn.setTitleColor(.white, for: .normal)
        cancelBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        cancelBtn.layer.cornerRadius = 5
        cancelBtn.backgroundColor = .systemPink
    }
    
    private func setupData() {
        titleLbl.text = StringConstants.statistics
        if let str = statisticsCombinedStr {
            subtitleLbl.text = str
        }
    }

    @IBAction func cancelBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
