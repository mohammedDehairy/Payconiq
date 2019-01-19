//
//  TransactionViewLayouter.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import CollectionKit

final class TransactionViewLayouter: ViewLayouter {
    func layout(for viewModel: ViewModel, constraintWidth: CGFloat) -> CGRect {
        guard let _ = viewModel as? TransactionViewModel else { return CGRect.zero }
        return CGRect(origin: CGPoint.zero, size: CGSize(width: constraintWidth, height: 120))
    }
}
