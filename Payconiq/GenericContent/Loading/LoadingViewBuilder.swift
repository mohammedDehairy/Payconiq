//
//  LoadingViewBuilder.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import CollectionKit

final class LoadingViewBuilder: ViewBuilder {
    let layouter: ViewLayouter
    let screenWidthProvider: ScreenWidthProvider
    var onVisible: (()->Void)?
    init(layouter: ViewLayouter, screenWidthProvider: ScreenWidthProvider) {
        self.layouter = layouter
        self.screenWidthProvider = screenWidthProvider
    }
    override func view(data: ViewModel, index: Int) -> UIView {
        guard data is LoadingViewModel else { return UIView() }
        let view = LoadingView()
        view.spinner.startAnimating()
        view.spinner.style = .gray
        return view
    }
    
    override func update(view: UIView, data: ViewModel, index: Int) {
        guard let model = data as? LoadingViewModel else { return }
        guard let view = view as? LoadingView else { return }
        layouter.layout(view: view, data: model, index: index, constraintWidth: screenWidthProvider.screenWidth)
        view.spinner.isAccessibilityElement = true
        view.spinner.accessibilityIdentifier = "loading"
        onVisible?()
    }
}
