//
//  CompoundViewLayouter.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import CollectionKit

final class CompoundViewLayouter: ViewLayouter {
    private let layouters: [String: ViewLayouter]
    init(layouters: [String: ViewLayouter]) {
        self.layouters = layouters
    }
    func layout(for viewModel: ViewModel, constraintWidth: CGFloat) -> CGRect {
        guard let layouter = layouters[String(describing: type(of: viewModel))] else { return CGRect.zero }
        return layouter.layout(for: viewModel, constraintWidth: constraintWidth)
    }
}
