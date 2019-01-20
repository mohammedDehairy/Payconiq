//
//  String+Size.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/20/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import UIKit

extension String {
    func size(with font: UIFont, constraintWidth: CGFloat) -> CGSize {
        // This is a Nasty short cut, can be refactored later
        let label =  UILabel(frame: CGRect(x: 0, y: 0, width: constraintWidth, height: .greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = self
        label.font = font
        label.sizeToFit()
        
        return label.frame.size
    }
}

