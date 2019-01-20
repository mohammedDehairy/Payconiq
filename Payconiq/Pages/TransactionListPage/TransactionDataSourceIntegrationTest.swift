//
//  TransactionDataSourceIntegrationTest.swift
//  PayconiqTests
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import XCTest

class TransactionDataSourceIntegrationTest: XCTestCase {
    func test_start_and_fetchNextPage() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-mm-yy HH:mm"
        let sut = TransactionDataSource(parser: TransactionViewModelParser(dateFormatter: dateFormatter), starterUrl: "http://demo5481020.mockable.io/transactions")
        let completionExpectation = expectation(description: "Expect TransactionDataSource completion to be called")
        completionExpectation.expectedFulfillmentCount = 2
        sut.start {
            completionExpectation.fulfill()
            XCTAssertEqual(sut._datasource.count, 56)
            sut.fetchNextPage {
                completionExpectation.fulfill()
                XCTAssertEqual(sut._datasource.count, 101)
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
}
