//
//  TransactionViewFactory.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import CollectionKit

final class TransactionViewBuilder: ViewBuilder {
    let dateFormatter: DateFormatter
    init(dateFormatter: DateFormatter) {
        self.dateFormatter = dateFormatter
    }
    override func view(data: ViewModel, index: Int) -> UIView {
        guard data is TransactionViewModel else { return UIView() }
        let view = TransactionView()
        return view
    }
    
    override func update(view: UIView, data: ViewModel, index: Int) {
        guard let model = data as? TransactionViewModel else { return }
        guard let view = view as? TransactionView else { return }
        let constraintWidth = UIScreen.main.bounds.width
        view.amoutLabel.text = model.amount
        view.textLabel.text = model.description
        view.amoutLabel.textColor = model.amount.hasPrefix("-") ? UIColor.defaultRed : UIColor.defaultGreen
        view.dateLabel.text = dateFormatter.string(from: model.date)
        view.amoutLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.textLabel.font = UIFont.systemFont(ofSize: 15)
        view.dateLabel.font = UIFont.systemFont(ofSize: 13, weight: .light)
        view.dateLabel.frame = CGRect(origin: CGPoint(x: (constraintWidth - view.dateLabel.intrinsicContentSize.width) * 0.1, y: 20), size: view.dateLabel.intrinsicContentSize)
        view.amoutLabel.frame = CGRect(origin: CGPoint(x: (constraintWidth - view.amoutLabel.intrinsicContentSize.width) * 0.1, y: view.dateLabel.frame.maxY + 10), size: view.amoutLabel.intrinsicContentSize)
        view.textLabel.frame = CGRect(origin: CGPoint(x: (constraintWidth - view.textLabel.intrinsicContentSize.width) * 0.1, y: view.amoutLabel.frame.maxY + 10), size: view.textLabel.intrinsicContentSize)
    }
}
