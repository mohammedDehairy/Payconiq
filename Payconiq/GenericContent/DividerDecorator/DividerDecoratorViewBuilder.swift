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
    let dividerBuilder: DividerViewBuilder
    let layouter: ViewLayouter
    init(subBuilder: ViewBuilder, layouter: ViewLayouter, dividerBuilder: DividerViewBuilder) {
        self.subBuilder = subBuilder
        self.layouter = layouter
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
        layouter.layout(view: view, data: data, index: index, constraintWidth: UIScreen.main.bounds.size.width)
    }
}
