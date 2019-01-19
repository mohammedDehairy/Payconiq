//
//  TransactionDataSource.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import CollectionKit

final class TransactionDataSource: DataSource<ViewModel> {
    private var _datasource: [TransactionViewModel] = []
    private let parser: ViewModelParser
    
    init(parser: ViewModelParser) {
        self.parser = parser
    }
    
    func start() {
        guard let url = URL(string: "http://demo5481020.mockable.io/transactions") else { return }
        let session = URLSession.shared
        let task = session.dataTask(with: url) {[weak self] data, response, error in
            self?.parse(data: data, response: response, error: error)
        }
        task.resume()
    }
    
    private func parse(data: Data?, response: URLResponse?, error: Error?) {
        guard let data = data else { return }
        guard let parsedModel = parser.parse(data: data) as? [TransactionViewModel] else { return }
        _datasource = parsedModel
        DispatchQueue.main.async {[weak self] in
            self?.reloadData()
        }
    }
    
    override var numberOfItems: Int {
        return _datasource.count
    }
    
    override func data(at: Int) -> TransactionViewModel {
        return _datasource[at]
    }
}
