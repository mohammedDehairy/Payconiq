//
//  TransactionViewLayouter.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import CollectionKit

final class TransactionViewLayouter: ViewLayouter {
    func layout(view: UIView, data: ViewModel, index: Int, constraintWidth: CGFloat) {
        guard let view = view as? TransactionView else { return }
        view.dateLabel.frame = CGRect(origin: CGPoint(x: (constraintWidth - view.dateLabel.intrinsicContentSize.width) * 0.1, y: 20), size: view.dateLabel.intrinsicContentSize)
        view.amoutLabel.frame = CGRect(origin: CGPoint(x: (constraintWidth - view.amoutLabel.intrinsicContentSize.width) * 0.1, y: view.dateLabel.frame.maxY + 10), size: view.amoutLabel.intrinsicContentSize)
        view.textLabel.frame = CGRect(origin: CGPoint(x: (constraintWidth - view.textLabel.intrinsicContentSize.width) * 0.1, y: view.amoutLabel.frame.maxY + 10), size: view.textLabel.intrinsicContentSize)
        view.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: constraintWidth, height: 120))
    }
    func size(for viewModel: ViewModel, constraintWidth: CGFloat) -> CGSize {
        guard let _ = viewModel as? TransactionViewModel else { return CGSize.zero }
        return CGSize(width: constraintWidth, height: 120)
    }
}
