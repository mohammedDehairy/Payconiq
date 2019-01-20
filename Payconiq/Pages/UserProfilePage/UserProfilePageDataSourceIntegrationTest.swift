//
//  UserProfilePageControllerIntegrationTest.swift
//  PayconiqTests
//
//  Created by mohamed mohamed El Dehairy on 1/20/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import XCTest

class UserProfilePageDataSourceIntegrationTest: XCTestCase {

    func test_start_and_fetchNextPage() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/mm/yy"
        let sut = UserProfilePageDataSource(parser: UserProfileParser(dateFormatter: dateFormatter), starterUrl: "http://demo5481020.mockable.io/userinfo")
        let completionExpectation = expectation(description: "Expect UserProfilePageDataSource completion to be called")
        sut.start {
            completionExpectation.fulfill()
            XCTAssertEqual(sut._datasource.count, 1)
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
}
