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
    let disposeBag = DisposeBag()
    init(builder: TransactionListPageBuilder) {
        self.builder = builder
        self.startListening()
    }
    
    private func startListening() {
        builder.viewController.rx.viewDidLoad.subscribe({ [weak self] _ in
                self?.builder.datasource.start()
            }).disposed(by: disposeBag)
        builder.provider.tapHandler = {[weak self] context in
            self?.handle(context: context)
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
        
    }
}
