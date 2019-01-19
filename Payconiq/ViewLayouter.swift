//
//  ViewLayouter.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import UIKit

protocol ViewLayouter {
    func layout(for viewModel: ViewModel, constraintWidth: CGFloat) -> CGRect
}
