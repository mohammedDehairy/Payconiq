//
//  UserProfileView.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/20/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import UIKit

final class UserProfileView: UIView {
    let nameLabel: UILabel = UILabel(frame: CGRect.zero)
    let birthDateLabel: UILabel = UILabel(frame: CGRect.zero)
    let nationalityLabel: UILabel = UILabel(frame: CGRect.zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(nameLabel)
        addSubview(birthDateLabel)
        addSubview(nationalityLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
