//
//  DividerDecoratorViewLayouter.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import UIKit

final class DividerDecoratorViewLayouter: ViewLayouter {
    let subLayouter: ViewLayouter
    let dividerLayouter: DividerViewLayouter
    init(subLayouter: ViewLayouter, dividerLayouter: DividerViewLayouter) {
        self.subLayouter = subLayouter
        self.dividerLayouter = dividerLayouter
    }
    func layout(for viewModel: ViewModel, constraintWidth: CGFloat) -> CGRect {
        let subLayout = subLayouter.layout(for: viewModel, constraintWidth: constraintWidth)
        let dividerLayout = dividerLayouter.layout(for: DividerViewModel(), constraintWidth: constraintWidth)
        return CGRect(origin: CGPoint.zero, size: CGSize(width: constraintWidth, height: subLayout.height + dividerLayout.height))
    }
}
