//
//  ContactManagerTest.swift
//  ContactManagerTest
//
//  Created by 박재우 on 2022/12/22.
//

import XCTest

final class ContactManagerTest: XCTestCase {

    override func setUpWithError() throws {}
    override func tearDownWithError() throws {}

    func testSplit() throws {
        XCTAssertEqual(split(input: "james/30/123-1234-1234"), ["james", "30", "123-1234-1234"])
    }

    func test나이() {
        XCTAssertEqual(getAge(input: "000"), nil)
        XCTAssertEqual(getAge(input: "1234"), nil)
        XCTAssertEqual(getAge(input: "-3"), nil)
        XCTAssertEqual(getAge(input: "23"), 23)
        XCTAssertEqual(getAge(input: "999"), 999)
        XCTAssertEqual(getAge(input: "0"), nil)
        XCTAssertEqual(getAge(input: "010"), nil)
    }

    func testPerformanceExample() throws {
        measure {}
    }

}
