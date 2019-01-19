//
//  DividerDecoratorViewBuilder.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import CollectionKit

final class DividerDecoratorViewBuilder: ViewBuilder {
    let subBuilder: ViewBuilder
    let subLayouter: ViewLayouter
    let dividerBuilder: DividerViewBuilder
    init(subBuilder: ViewBuilder, subLayouter: ViewLayouter, dividerBuilder: DividerViewBuilder) {
        self.subBuilder = subBuilder
        self.subLayouter = subLayouter
        self.dividerBuilder = dividerBuilder
    }
    override func view(data: ViewModel, index: Int) -> UIView {
        guard let dividerView = dividerBuilder.view(data: DividerViewModel(), index: index) as? DividerView else { return UIView() }
        let subView = subBuilder.view(data: data, index: index)
        return DividerDecoratorView(dividerView: dividerView, subView: subView)
    }
    
    override func update(view: UIView, data: ViewModel, index: Int) {
        guard let view = view as? DividerDecoratorView else { return }
        subBuilder.update(view: view.subView, data: data, index: index)
        dividerBuilder.update(view: view.dividerView, data: DividerViewModel(), index: index)
        let subViewSize = subLayouter.layout(for: data, constraintWidth: UIScreen.main.bounds.size.width).size
        view.subView.frame = CGRect(origin: CGPoint.zero, size: subViewSize)
        view.dividerView.frame = CGRect(origin: CGPoint(x: 0, y: view.subView.frame.maxY), size: CGSize(width: UIScreen.main.bounds.width, height: 1))
    }
}
