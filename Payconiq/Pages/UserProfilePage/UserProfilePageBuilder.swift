//
//  UserProfilePageBuilder.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/20/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import CollectionKit
import UIKit

final class UserProfilePageBuilder: PageBuilder {
    lazy var collectionView: CollectionView = {
        return CollectionView(provider: provider)
    }()
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/mm/yyyy"
        return dateFormatter
    }()
    
    lazy var datasource: PayconiqDataSource = {
        return UserProfilePageDataSource(parser: UserProfileParser(dateFormatter: dateFormatter), starterUrl: "http://demo5481020.mockable.io/userinfo")
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
        viewController.title = "User Profile"
        viewController.view.backgroundColor = UIColor.white
        return viewController
    }()
    
    lazy var builders: [String: ViewBuilder] = {
        var builders = [String: ViewBuilder]()
        builders[String(describing: UserProfileViewModel.self)] = UserProfileViewBuilder(layouter: UserProfileViewLayouter())
        return builders
    }()
    
    lazy var layouter: CompoundViewLayouter = {
        return CompoundViewLayouter(layouters: self.layouters)
    }()
    
    lazy var layouters: [String: ViewLayouter] = {
        var layouters = [String: ViewLayouter]()
        layouters[String(describing: UserProfileViewModel.self)] = UserProfileViewLayouter()
        return layouters
    }()
}
