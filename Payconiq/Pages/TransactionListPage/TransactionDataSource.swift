//
//  TransactionDataSource.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import CollectionKit

final class TransactionDataSource: PayconiqDataSource {
    
    override func hardReload(data: [ViewModel]) {
        _datasource = data
        _datasource.append(LoadingViewModel())
        reloadData()
    }
    
    override func append(data: [ViewModel]) {
        removeLoadingModel()
        _datasource.append(contentsOf: data)
        _datasource.append(LoadingViewModel())
        reloadData()
    }
    
    private func removeLoadingModel() {
        if let _ = _datasource.last as? LoadingViewModel {
            _datasource.removeLast()
            reloadData()
        }
    }
}
