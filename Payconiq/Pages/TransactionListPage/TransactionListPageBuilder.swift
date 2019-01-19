//
//  TransactionListBuilder.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import CollectionKit
import UIKit

final class TransactionListPageBuilder {
    lazy var collectionView: CollectionView = {
        return CollectionView(provider: provider)
    }()
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-mm-yy HH:mm"
        return dateFormatter
    }()
    
    lazy var datasource: TransactionDataSource = {
        return TransactionDataSource(parser: TransactionViewModelParser(dateFormatter: dateFormatter))
    }()
    
    lazy var provider: BasicProvider<ViewModel, UIView> = {
        let viewsource = CompoundViewBuilder(builders: builders)
        let sizesource: (Int, ViewModel, CGSize) -> CGSize = {[unowned self] index, data, collectionSize in
            return self.layouter.layout(for: data, constraintWidth: collectionSize.width).size
        }
        return BasicProvider<ViewModel, UIView>(dataSource: datasource, viewSource: viewsource, sizeSource: sizesource)
    }()
    
    lazy var viewController: CollectionViewController = {
        return CollectionViewController(provider: provider, collectionView: collectionView)
    }()
    
    lazy var builders: [String: ViewBuilder] = {
        var builders = [String: ViewBuilder]()
        builders[String(describing: TransactionViewModel.self)] = DividerDecoratorViewBuilder(subBuilder: TransactionViewBuilder(dateFormatter: dateFormatter), subLayouter: TransactionViewLayouter(), dividerBuilder: DividerViewBuilder())
        return builders
    }()
    
    lazy var layouter: CompoundViewLayouter = {
        return CompoundViewLayouter(layouters: self.layouters)
    }()
    
    lazy var layouters: [String: ViewLayouter] = {
        var layouters = [String: ViewLayouter]()
        layouters[String(describing: TransactionViewModel.self)] = DividerDecoratorViewLayouter(subLayouter: TransactionViewLayouter(), dividerLayouter: DividerViewLayouter())
        return layouters
    }()
}
