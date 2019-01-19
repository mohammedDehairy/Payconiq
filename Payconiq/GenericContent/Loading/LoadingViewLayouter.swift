//
//  LoadingViewLayouter.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import UIKit

final class LoadingViewLayouter: ViewLayouter {
    func layout(view: UIView, data: ViewModel, index: Int, constraintWidth: CGFloat) {
        guard let view = view as? LoadingView else { return }
        view.spinner.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: constraintWidth, height: 80))
    }
    
    func size(for viewModel: ViewModel, constraintWidth: CGFloat) -> CGSize {
        guard let _ = viewModel as? LoadingViewModel else { return CGSize.zero }
        return CGSize(width: constraintWidth, height: 80)
    }
}
