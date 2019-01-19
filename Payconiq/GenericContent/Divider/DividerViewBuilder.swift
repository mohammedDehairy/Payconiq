//
//  DividerViewBuilder.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import CollectionKit

final class DividerViewBuilder: ViewBuilder {
    override func view(data: ViewModel, index: Int) -> UIView {
        guard data is DividerViewModel else { return UIView() }
        let view = DividerView()
        view.backgroundColor = UIColor.gray
        return view
    }
    
    override func update(view: UIView, data: ViewModel, index: Int) { }
}
