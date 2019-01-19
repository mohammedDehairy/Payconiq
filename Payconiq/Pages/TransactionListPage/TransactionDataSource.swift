//
//  TransactionDataSource.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import CollectionKit

final class TransactionDataSource: DataSource<ViewModel> {
    private(set) var _datasource: [ViewModel] = []
    private let parser: ViewModelParser
    private let starterUrl = "http://demo5481020.mockable.io/transactions"
    private var nextpPageUrl: String?
    
    init(parser: ViewModelParser) {
        self.parser = parser
    }
    
    func start(completion: (()->Void)?) {
        fetch(url: starterUrl, completion: {[weak self] result in
            DispatchQueue.main.async {
                self?.hardReload(data: result)
                completion?()
            }
        })
    }
    
    private func hardReload(data: [ViewModel]) {
        _datasource = data
        _datasource.append(LoadingViewModel())
        reloadData()
    }
    
    func fetchNextPage(completion: (()->Void)?) {
        guard let nextpPageUrl = nextpPageUrl, !nextpPageUrl.isEmpty else { completion?(); return }
        fetch(url: nextpPageUrl, completion: {[weak self] result in
            DispatchQueue.main.async {
                self?.append(data: result)
                completion?()
            }
        })
    }
    
    private func append(data: [ViewModel]) {
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
    
    private func fetch(url: String, completion: (([ViewModel])->Void)?) {
        guard let url = URL(string: url) else { completion?([]); return }
        let session = URLSession.shared
        let task = session.dataTask(with: url) {[weak self] data, response, error in
            guard let parsedModel = self?.parse(data: data, response: response, error: error) else { completion?([]); return }
            completion?(parsedModel)
        }
        task.resume()
    }
    
    private func parse(data: Data?, response: URLResponse?, error: Error?) -> [ViewModel] {
        guard let data = data else { return [] }
        guard let parsedModel = parser.parse(data: data) as? [TransactionViewModel] else { return [] }
        guard let response = response as? HTTPURLResponse else { return [] }
        nextpPageUrl = response.allHeaderFields["next-page"] as? String
        return parsedModel
    }
    
    override var numberOfItems: Int {
        return _datasource.count
    }
    
    override func data(at: Int) -> ViewModel {
        return _datasource[at]
    }
}
