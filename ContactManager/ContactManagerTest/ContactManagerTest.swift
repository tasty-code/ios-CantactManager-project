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
    }
    
    func testPerformanceExample() throws {
        measure {}
    }

}
