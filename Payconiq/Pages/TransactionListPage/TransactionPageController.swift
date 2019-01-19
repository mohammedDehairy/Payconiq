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
    private weak var presenter: TransactionDetailsPresenter?
    private let disposeBag = DisposeBag()
    init(builder: TransactionListPageBuilder, presenter: TransactionDetailsPresenter) {
        self.builder = builder
        self.presenter = presenter
        self.startListening()
    }
    
    private func startListening() {
        let refreshControl = builder.viewController.refreshControl
        builder.viewController.rx.viewDidLoad.subscribe({ [weak self] _ in
            refreshControl.beginRefreshing()
            self?.builder.datasource.start {
                refreshControl.endRefreshing()
            }
        }).disposed(by: disposeBag)
        
        builder.provider.tapHandler = {[weak self] context in
            self?.handle(context: context)
        }
        
        refreshControl.rx.controlEvent(.valueChanged).subscribe({ [weak self] _ in
            self?.builder.datasource.start(completion: {
                refreshControl.endRefreshing()
            })
        }).disposed(by: disposeBag)
        
        builder.loadingViewBuilder.onVisible = {[weak self] in
            self?.builder.datasource.fetchNextPage(completion: nil)
        }
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
