//
//  TransactionViewLayouter.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import CollectionKit

private struct TransactionViewLayout {
    var dateSize: CGSize = .zero
    var textSize: CGSize = .zero
    var amountSize: CGSize = .zero
    var size: CGSize = .zero
}

final class TransactionViewLayouter: ViewLayouter {
    let dateFormatter: DateFormatter
    init(dateFormatter: DateFormatter) {
        self.dateFormatter = dateFormatter
    }
    func layout(view: UIView, data: ViewModel, index: Int, constraintWidth: CGFloat) {
        guard let view = view as? TransactionView else { return }
        let sideMargin: CGFloat = 20
        let constraintWidth = constraintWidth - sideMargin * 2
        let layout = getLayout(for: data, constraintWidth: constraintWidth)
        view.dateLabel.frame = CGRect(origin: CGPoint(x: max(sideMargin, (constraintWidth - layout.dateSize.width) * 0.1) , y: 20), size: layout.dateSize)
        view.amoutLabel.frame = CGRect(origin: CGPoint(x: max(sideMargin, (constraintWidth - layout.amountSize.width) * 0.1), y: view.dateLabel.frame.maxY + 10), size: layout.amountSize)
        view.textLabel.frame = CGRect(origin: CGPoint(x: max(sideMargin, (constraintWidth - layout.textSize.width) * 0.1), y: view.amoutLabel.frame.maxY + 10), size: layout.textSize)
        view.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: constraintWidth, height: view.textLabel.frame.maxY + 10))
    }
    
    func size(for viewModel: ViewModel, constraintWidth: CGFloat) -> CGSize {
        return getLayout(for: viewModel, constraintWidth: constraintWidth - 40).size
    }
    
    private func getLayout(for viewModel: ViewModel, constraintWidth: CGFloat) -> TransactionViewLayout {
        guard let model = viewModel as? TransactionViewModel else { return TransactionViewLayout() }
        var layout = TransactionViewLayout()
        layout.dateSize = dateFormatter.string(from: model.date).size(with: UIFont.systemFont(ofSize: 13, weight: .light), constraintWidth: constraintWidth)
        layout.amountSize = model.amount.size(with: UIFont.boldSystemFont(ofSize: 20), constraintWidth: constraintWidth)
        layout.textSize = model.description.size(with: UIFont.systemFont(ofSize: 15), constraintWidth: constraintWidth)
        layout.size = CGSize(width: constraintWidth, height: 20 + layout.dateSize.height + 10 + layout.amountSize.height + 10 + layout.textSize.height + 10)
        return layout
    }
}
