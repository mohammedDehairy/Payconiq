//
//  TransactionViewSource.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import CollectionKit

class ViewBuilder: ViewSource<ViewModel, UIView> { }

class CompoundViewBuilder: ViewSource<ViewModel, UIView> {
    private let builders: [String: ViewBuilder]
    init(builders: [String: ViewBuilder]) {
        self.builders = builders
    }
    override func view(data: ViewModel, index: Int) -> UIView {
        guard let builder = builders[String(describing: type(of: data))] else { return UIView() }
        let view = reuseManager.dequeue(builder.view(data: data, index: index))
        update(view: view, data: data, index: index)
        return view
    }
    
    override func update(view: UIView, data: ViewModel, index: Int) {
        guard let builder = builders[String(describing: type(of: data))] else { return }
        return builder.update(view: view, data: data, index: index)
    }
}
