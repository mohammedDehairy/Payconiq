//
//  TransactionViewModelParserTest.swift
//  PayconiqTests
//
//  Created by mohamed mohamed El Dehairy on 1/19/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import XCTest

class TransactionViewModelParserTest: XCTestCase {

    func test_parsing() {
        let path = Bundle(for: type(of: self)).path(forResource: "test_transactions", ofType: "json")!
        let url = URL(fileURLWithPath: path)
        let data = try! Data(contentsOf: url)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-mm-yy HH:mm"
        let parser = TransactionViewModelParser(dateFormatter: dateFormatter)
        let objects = parser.parse(data: data)
        XCTAssertTrue(objects is [TransactionViewModel])
        let transactions = objects as! [TransactionViewModel]
        XCTAssertEqual(transactions.count, 3)
        XCTAssertEqual(transactions[0].coordinates.coordinate.longitude, 4.8432112)
        XCTAssertEqual(transactions[0].coordinates.coordinate.latitude, 52.3872824)
        
        XCTAssertEqual(transactions[1].description, "Transaction 2")
        XCTAssertEqual(transactions[0].date, dateFormatter.date(from: "8-01-18 14:18"))
        XCTAssertEqual(transactions[1].date, dateFormatter.date(from: "9-01-18 13:12"))
        XCTAssertEqual(transactions[2].date, dateFormatter.date(from: "18-01-18 20:39"))
        XCTAssertEqual(transactions[2].coordinates.coordinate.longitude, 4.8422241)
        XCTAssertEqual(transactions[2].coordinates.coordinate.latitude, 52.3877146)
    }

}
