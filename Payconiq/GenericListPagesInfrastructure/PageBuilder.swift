//
//  PageBuilder.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/20/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import CollectionKit
import UIKit

protocol PageBuilder {
    var collectionView: CollectionView { get }
    var datasource: PayconiqDataSource { get }
    var provider: BasicProvider<ViewModel, UIView> { get }
    var viewController: CollectionViewController { get }
}
