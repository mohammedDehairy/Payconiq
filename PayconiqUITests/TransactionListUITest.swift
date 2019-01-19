//
//  TransactionListUITest.swift
//  PayconiqUITests
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import XCTest

class TransactionListUITest: XCTestCase {

    override func setUp() {
        continueAfterFailure = false

        XCUIApplication().launch()
    }

    func test_loading_transaction_list() {
        XCTAssertTrue(wait(for:[XCUIApplication().textFields["transaction_1"],
                  XCUIApplication().textFields["transaction_2"],
                  XCUIApplication().textFields["transaction_3"],
                  XCUIApplication().textFields["transaction_4"]
            ], timeout: 20))
    }
    
    func test_taping_on_transaction() {
        _ = wait(for: [XCUIApplication().textFields["transaction_1"]], timeout: 20)
        XCUIApplication().textFields["transaction_1"].tap()
        XCTAssertTrue(wait(for: [XCUIApplication().textFields["details_page_amount_label"]], timeout: 10))
    }
    
    private func wait(for elements: [XCUIElement], timeout: TimeInterval) -> Bool {
        let predicate = NSPredicate { elements, _ in
            guard let elements = elements as? [XCUIElement] else { return false }
            return elements.reduce(true, { $0 && $1.exists })
        }
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: elements)
        return XCTWaiter().wait(for: [expectation], timeout: timeout) == .completed
    }

}
