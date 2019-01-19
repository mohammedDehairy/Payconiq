//
//  TransactionView.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import UIKit

final class TransactionView: UIView {
    let amoutLabel: UILabel = UILabel(frame: CGRect.zero)
    let textLabel: UILabel = UILabel(frame: CGRect.zero)
    let dateLabel: UILabel = UILabel(frame: CGRect.zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(amoutLabel)
        addSubview(textLabel)
        addSubview(dateLabel)
        textLabel.isAccessibilityElement = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
