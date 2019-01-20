//
//  ViewLayouter.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import UIKit

protocol ViewLayouter {
    func layout(view: UIView, data: ViewModel, index: Int, constraintWidth: CGFloat)
    func size(for viewModel: ViewModel, constraintWidth: CGFloat) -> CGSize
}
