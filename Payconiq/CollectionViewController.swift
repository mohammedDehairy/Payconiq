//
//  CollectionViewController.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import UIKit
import CollectionKit

class CollectionViewController: UIViewController {

    private let provider: BasicProvider<ViewModel, UIView>
    private let collectionView: CollectionView
    let refreshControl: UIRefreshControl
    init(provider: BasicProvider<ViewModel, UIView>, collectionView: CollectionView) {
        self.provider = provider
        self.collectionView = collectionView
        self.refreshControl = UIRefreshControl()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.refreshControl = refreshControl
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = CGRect(origin: CGPoint(x: view.safeAreaInsets.left, y: view.safeAreaInsets.top), size: CGSize(width: view.bounds.size.width - view.safeAreaInsets.left - view.safeAreaInsets.right, height: view.bounds.size.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom))
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView.alpha = 0.0
        coordinator.animate(alongsideTransition: {[weak self] _ in
            self?.collectionView.reloadData()
            }, completion: {[weak self] _ in
                UIView.animate(withDuration: 0.2, animations: {
                    self?.collectionView.alpha = 1.0
                })
        })
    }
}
