//
//  PayconiqDataSource.swift
//  Payconiq
//
//  Created by mohamed mohamed El Dehairy on 1/20/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import CollectionKit

class PayconiqDataSource: DataSource<ViewModel> {
    var _datasource: [ViewModel] = []
    private let parser: ViewModelParser
    private let starterUrl: String
    private var nextpPageUrl: String?
    
    init(parser: ViewModelParser, starterUrl: String) {
        self.parser = parser
        self.starterUrl = starterUrl
    }
    
    func start(completion: (()->Void)?) {
        fetch(url: starterUrl, completion: {[weak self] result in
            DispatchQueue.main.async {
                self?.hardReload(data: result)
                completion?()
            }
        })
    }
    
    func hardReload(data: [ViewModel]) {
        assertionFailure("PayconiqDataSource is an Abstract class, hardReload(data:) should be implemented in a subclass")
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
    
    func append(data: [ViewModel]) {
        assertionFailure("PayconiqDataSource is an Abstract class, append(data:) should be implemented in a subclass")
    }
    
    func fetch(url: String, completion: (([ViewModel])->Void)?) {
        guard let url = URL(string: url) else { completion?([]); return }
        let session = URLSession.shared
        let task = session.dataTask(with: url) {[weak self] data, response, error in
            guard let parsedModel = self?.parse(data: data, response: response, error: error) else { completion?([]); return }
            completion?(parsedModel)
        }
        task.resume()
    }
    
    func parse(data: Data?, response: URLResponse?, error: Error?) -> [ViewModel] {
        guard let data = data else { return [] }
        guard let response = response as? HTTPURLResponse else { return [] }
        let parsedModel = parser.parse(data: data)
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
