//
//  UserProfileParserTest.swift
//  PayconiqTests
//
//  Created by mohamed mohamed El Dehairy on 1/20/19.
//  Copyright © 2019 mohamed El Dehairy. All rights reserved.
//

import XCTest

class UserProfileParserTest: XCTestCase {

    func test_parsing() {
        let path = Bundle(for: type(of: self)).path(forResource: "test_profile", ofType: "json")!
        let url = URL(fileURLWithPath: path)
        let data = try! Data(contentsOf: url)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/mm/yyyy"
        let parser = UserProfileParser(dateFormatter: dateFormatter)
        let objects = parser.parse(data: data)
        XCTAssertTrue(objects is [UserProfileViewModel])
        XCTAssertEqual(objects.count, 1)
        let profile = (objects as! [UserProfileViewModel])[0]
        XCTAssertEqual(profile.firstName, "Ernesto")
        XCTAssertEqual(profile.lastName, "Skipper")
        XCTAssertEqual(profile.birthDate, "15/08/1970")
        XCTAssertEqual(profile.nationality, "AUS")
    }

}
