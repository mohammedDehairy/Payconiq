//
//  DividerViewLayouter.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import UIKit

final class DividerViewLayouter: ViewLayouter {
    func layout(view: UIView, data: ViewModel, index: Int, constraintWidth: CGFloat) {
        view.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: constraintWidth, height: 1))
    }
    
    func size(for viewModel: ViewModel, constraintWidth: CGFloat) -> CGSize {
        guard let _ = viewModel as? DividerViewModel else { return CGSize.zero }
        return CGSize(width: constraintWidth, height: 1)
    }
}
