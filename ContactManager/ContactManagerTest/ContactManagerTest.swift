//
//  ContactManagerTest.swift
//  ContactManagerTest
//
//  Created by 박재우 on 2022/12/22.
//

import XCTest

final class ContactManagerTest: XCTestCase {
    func testSplit() throws {
        XCTAssertEqual(split(input: "james/30/123-1234-1234"), ["james", "30", "123-1234-1234"])
        XCTAssertEqual(split(input: "james / 30 / 123-1234-1234"), ["james", "30", "123-1234-1234"])
        XCTAssertEqual(split(input: "james / 30 / "), ["james", "30", ""])
        XCTAssertEqual(split(input: "james/30/"), ["james", "30", ""])
        XCTAssertNil(split(input: ""))
        XCTAssertNil(split(input: "james/30"))
        XCTAssertNil(split(input: "james / 30 / 123-1234-1234 / 40"))
        XCTAssertNil(split(input: "james/30/123-1234-1234/40"))
    }

    // TODO: split에서 처리하던 앞뒤 공백을 이름, 나이, 전화번호에서 처리하도록 변경
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
        XCTAssertEqual(getAge(input: "0"), 0)
        XCTAssertEqual(getAge(input: "010"), nil)
    }

    func test전화번호() {
        XCTAssertFalse(isValidPhoneNumber(input: "054342334"))
        XCTAssertFalse(isValidPhoneNumber(input: "05-4342334"))
        XCTAssertFalse(isValidPhoneNumber(input: "05-4342334-"))
        XCTAssertFalse(isValidPhoneNumber(input: "-05434-2334"))
        XCTAssertFalse(isValidPhoneNumber(input: "05434--2334"))
        XCTAssertFalse(isValidPhoneNumber(input: "05-434-23-34"))
        XCTAssertFalse(isValidPhoneNumber(input: "05-434-234"))
        XCTAssertFalse(isValidPhoneNumber(input: "05 434 2334"))
        XCTAssertFalse(isValidPhoneNumber(input: "james"))
        XCTAssertFalse(isValidPhoneNumber(input: "전화번호부"))
        XCTAssertFalse(isValidPhoneNumber(input: ""))
    }

    func testPerformanceExample() throws {
        measure {}
    }

}
