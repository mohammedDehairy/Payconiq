//
//  RootViewController.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import UIKit
import CollectionKit

class RootViewController: UIViewController, TransactionDetailsPresenter {
    private lazy var controller: TransactionPageController = {
        return TransactionPageController(builder: TransactionListPageBuilder(), presenter: self)
    }()
    
    private lazy var navigationViewController: UINavigationController = {
        return UINavigationController(rootViewController: controller.builder.viewController)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationViewController.willMove(toParent: self)
        addChild(navigationViewController)
        view.addSubview(navigationViewController.view)
        navigationViewController.didMove(toParent: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationViewController.view.frame = CGRect(origin: CGPoint.zero, size: view.bounds.size)
    }
    
    func presen(model: TransactionViewModel, animated: Bool, completion: (() -> Void)) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailsViewController = storyboard.instantiateViewController(withIdentifier: "TransactionDetailsViewController") as? TransactionDetailsViewController else { return }
        detailsViewController.model = model
        detailsViewController.title = model.description
        detailsViewController.view.backgroundColor = UIColor.white
        navigationViewController.pushViewController(detailsViewController, animated: true)
    }
}

