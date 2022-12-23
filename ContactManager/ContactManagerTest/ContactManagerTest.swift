//
//  ContactManagerTest.swift
//  ContactManagerTest
//
//  Created by 박재우 on 2022/12/22.
//

import XCTest

final class ContactManagerTest: XCTestCase {
    func testFirstString() throws {
        XCTAssertEqual("abcd".firstString, "a")
        XCTAssertEqual("".firstString, "")
        XCTAssertEqual(" abcd".firstString, " ")
    }

    func testLastString() throws {
        XCTAssertEqual("abcd".lastString, "d")
        XCTAssertEqual("".lastString, "")
        XCTAssertEqual("42".lastString, "2")
    }

    func testSplit() throws {
        XCTAssertEqual(split(input: "james/30/123-1234-1234"), ["james", "30", "123-1234-1234"])
        XCTAssertEqual(split(input: "james / 30 / 123-1234-1234"), ["james", "30", "123-1234-1234"])
        XCTAssertNil(split(input: "james / 30/123-1234-1234"))
        XCTAssertNil(split(input: "james /30/123-1234-1234"))
        XCTAssertNil(split(input: "james/ 30/123-1234-1234"))
        XCTAssertNil(split(input: "james/30 /123-1234-1234"))
        XCTAssertNil(split(input: "james/30/ 123-1234-1234"))
        XCTAssertNil(split(input: " james/30/123-1234-1234"))
        XCTAssertNil(split(input: "james/30/123-1234-1234 "))
    }

    func test이름() {
        XCTAssertNil(getName(input: "한글의이름"))
        XCTAssertNil(getName(input: ""))
        XCTAssertEqual(getName(input: "james"), "james")
        XCTAssertEqual(getName(input: "jam  es"), "james")
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

    func test전화번호() {
        XCTAssertNil(getPhoneNumber(input: "054342334"))
        XCTAssertNil(getPhoneNumber(input: "05-4342334"))
        XCTAssertNil(getPhoneNumber(input: "05-4342334-"))
        XCTAssertNil(getPhoneNumber(input: "-05434-2334"))
        XCTAssertNil(getPhoneNumber(input: "05434--2334"))
        XCTAssertNil(getPhoneNumber(input: "05-434-23-34"))
        XCTAssertNil(getPhoneNumber(input: "05-434-234"))
        XCTAssertNil(getPhoneNumber(input: "05 434 2334"))
        XCTAssertNil(getPhoneNumber(input: "james"))
        XCTAssertNil(getPhoneNumber(input: "전화번호부"))
    }

    func testPerformanceExample() throws {
        measure {}
    }

}
