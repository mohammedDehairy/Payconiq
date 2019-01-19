//
//  DividerDecoratorView.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import UIKit

final class DividerDecoratorView: UIView {
    let dividerView: DividerView
    let subView: UIView
    
    init(dividerView: DividerView, subView: UIView) {
        self.subView = subView
        self.dividerView = dividerView
        super.init(frame: CGRect.zero)
        addSubview(dividerView)
        addSubview(subView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
