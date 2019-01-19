//
//  TransactionDetailsViewController.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import UIKit

class TransactionDetailsViewController: UIViewController {
    var model: TransactionViewModel?
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-mm-yy HH:mm"
        return dateFormatter
    }()
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let model = model {
            amountLabel.text = model.amount
            amountLabel.textColor = model.amount.hasPrefix("-") ? UIColor.defaultRed : UIColor.defaultGreen
            dateLabel.text = dateFormatter.string(from: model.date)
            amountLabel.font = UIFont.boldSystemFont(ofSize: 30)
            dateLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
        }
        amountLabel.isAccessibilityElement = true
        amountLabel.accessibilityIdentifier = "details_page_amount_label"
    }

}
