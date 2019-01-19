//
//  RootViewController.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import UIKit
import CollectionKit

class RootViewController: UIViewController {
    private let controller: TransactionPageController = TransactionPageController(builder: TransactionListPageBuilder())
    private lazy var transactionsViewController: CollectionViewController = {
        return controller.builder.viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transactionsViewController.willMove(toParent: self)
        addChild(transactionsViewController)
        view.addSubview(transactionsViewController.view)
        transactionsViewController.didMove(toParent: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        transactionsViewController.view.frame = CGRect(origin: CGPoint.zero, size: view.bounds.size)
    }
}

