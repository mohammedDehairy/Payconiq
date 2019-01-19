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
    func layout(view: UIView, data: ViewModel, index: Int, constraintWidth: CGFloat) {
        guard let layouter = layouters[String(describing: type(of: data))] else { return }
        layouter.layout(view: view, data: data, index: index, constraintWidth: constraintWidth)
    }
    func size(for viewModel: ViewModel, constraintWidth: CGFloat) -> CGSize {
        guard let layouter = layouters[String(describing: type(of: viewModel))] else { return CGSize.zero }
        return layouter.size(for: viewModel, constraintWidth: constraintWidth)
    }
}
