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
    
    func layout(view: UIView, data: ViewModel, index: Int, constraintWidth: CGFloat) {
        guard let view = view as? DividerDecoratorView else { return }
        subLayouter.layout(view: view, data: data, index: index, constraintWidth: constraintWidth)
        dividerLayouter.layout(view: view.dividerView, data: DividerViewModel(), index: index, constraintWidth: constraintWidth)
        view.dividerView.frame.origin = CGPoint(x: view.subView.frame.origin.x, y: view.subView.frame.maxY)
        view.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: constraintWidth, height: view.subView.frame.size.height + view.dividerView.frame.size.height))
    }
    
    func size(for viewModel: ViewModel, constraintWidth: CGFloat) -> CGSize {
        let subSize = subLayouter.size(for: viewModel, constraintWidth: constraintWidth)
        let dividerSize = dividerLayouter.size(for: DividerViewModel(), constraintWidth: constraintWidth)
        return CGSize(width: constraintWidth, height: subSize.height + dividerSize.height)
    }
}
