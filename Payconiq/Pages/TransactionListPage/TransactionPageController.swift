//
//  TransactionPageController.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import Foundation
import CollectionKit
import RxSwift
import RxViewController

final class TransactionPageController {
    let builder: TransactionListPageBuilder
    weak var presenter: TransactionDetailsPresenter?
    let disposeBag = DisposeBag()
    init(builder: TransactionListPageBuilder, presenter: TransactionDetailsPresenter) {
        self.builder = builder
        self.presenter = presenter
        self.startListening()
    }
    
    private func startListening() {
        builder.viewController.rx.viewDidLoad.subscribe({ [weak self] _ in
            self?.builder.datasource.start(completion: nil)
            }).disposed(by: disposeBag)
        builder.provider.tapHandler = {[weak self] context in
            self?.handle(context: context)
        }
        let refreshControl = builder.viewController.refreshControl
        refreshControl.rx.controlEvent(.valueChanged).subscribe({ [weak self] _ in
            self?.builder.datasource.start(completion: {
                refreshControl.endRefreshing()
            })
        }).disposed(by: disposeBag)
    }
    
    private func handle(context: BasicProvider<ViewModel, UIView>.TapContext) {
        let model = context.data
        switch model {
        case let model as TransactionViewModel:
            handle(transaction: model)
        default:
            break
        }
    }
    
    private func handle(transaction: TransactionViewModel) {
        presenter?.presen(model: transaction, animated: true, completion: {})
    }
}
