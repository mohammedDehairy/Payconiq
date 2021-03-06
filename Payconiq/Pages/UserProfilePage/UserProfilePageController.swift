//
//  UserProfilePageController.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/20/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import Foundation
import CollectionKit
import RxSwift
import RxViewController

final class UserProfilePageController: PageController {
    let builder: PageBuilder
    private let disposeBag = DisposeBag()
    
    init(builder: PageBuilder) {
        self.builder = builder
    }
    
    func startListening() {
        let refreshControl = builder.viewController.refreshControl
        builder.viewController.rx.willMoveToParentViewController.subscribe({ [weak self] _ in
            refreshControl.beginRefreshing()
            self?.builder.datasource.start {
                refreshControl.endRefreshing()
            }
        }).disposed(by: disposeBag)
        
        refreshControl.rx.controlEvent(.valueChanged).subscribe({ [weak self] _ in
            self?.builder.datasource.start(completion: {
                refreshControl.endRefreshing()
            })
        }).disposed(by: disposeBag)
    }
}

