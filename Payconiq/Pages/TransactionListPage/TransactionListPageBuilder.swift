//
//  TransactionListBuilder.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import CollectionKit
import UIKit

final class TransactionListPageBuilder: PageBuilder {
    lazy var collectionView: CollectionView = {
        return CollectionView(provider: provider)
    }()
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-mm-yy HH:mm"
        return dateFormatter
    }()
    
    lazy var datasource: PayconiqDataSource = {
        return TransactionDataSource(parser: TransactionViewModelParser(dateFormatter: dateFormatter), starterUrl: "http://demo5481020.mockable.io/transactions")
    }()
    
    lazy var provider: BasicProvider<ViewModel, UIView> = {
        let viewsource = CompoundViewBuilder(builders: builders)
        let sizesource: (Int, ViewModel, CGSize) -> CGSize = {[unowned self] index, data, collectionSize in
            return self.layouter.size(for: data, constraintWidth: collectionSize.width)
        }
        return BasicProvider<ViewModel, UIView>(dataSource: datasource, viewSource: viewsource, sizeSource: sizesource)
    }()
    
    lazy var viewController: CollectionViewController = {
        let viewController = CollectionViewController(collectionView: collectionView)
        viewController.title = "History"
        return viewController
    }()
    
    lazy var builders: [String: ViewBuilder] = {
        var builders = [String: ViewBuilder]()
        builders[String(describing: TransactionViewModel.self)] = DividerDecoratorViewBuilder(subBuilder: TransactionViewBuilder(dateFormatter: dateFormatter, layouter: TransactionViewLayouter()), layouter: DividerDecoratorViewLayouter(subLayouter: TransactionViewLayouter(), dividerLayouter: DividerViewLayouter()), dividerBuilder: DividerViewBuilder())
        builders[String(describing: LoadingViewModel.self)] = loadingViewBuilder
        return builders
    }()
    
    lazy var loadingViewBuilder: LoadingViewBuilder = {
        return LoadingViewBuilder(layouter: LoadingViewLayouter())
    }()
    
    lazy var layouter: CompoundViewLayouter = {
        return CompoundViewLayouter(layouters: self.layouters)
    }()
    
    lazy var layouters: [String: ViewLayouter] = {
        var layouters = [String: ViewLayouter]()
        layouters[String(describing: TransactionViewModel.self)] = DividerDecoratorViewLayouter(subLayouter: TransactionViewLayouter(), dividerLayouter: DividerViewLayouter())
        layouters[String(describing: LoadingViewModel.self)] = LoadingViewLayouter()
        return layouters
    }()
}
