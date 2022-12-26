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

    func test이름() {
        XCTAssertNil(getName(input: "한글의이름"))
        XCTAssertNil(getName(input: ""))
        XCTAssertEqual(getName(input: "james"), "james")
        XCTAssertEqual(getName(input: "jam  es"), "james")
        XCTAssertNil(getName(input: " james "))
        XCTAssertNil(getName(input: " james"))
        XCTAssertNil(getName(input: "james "))
    }

    func test나이() {
        XCTAssertNil(getAge(input: "000"))
        XCTAssertNil(getAge(input: "1234"))
        XCTAssertNil(getAge(input: "-3"))
        XCTAssertNil(getAge(input: "010"))
        XCTAssertNil(getAge(input: " 10 "))
        XCTAssertNil(getAge(input: " 10"))
        XCTAssertNil(getAge(input: "10 "))
        XCTAssertEqual(getAge(input: "23"), 23)
        XCTAssertEqual(getAge(input: "999"), 999)
        XCTAssertEqual(getAge(input: "0"), 0)
    }

    func test전화번호() {
        XCTAssertTrue(isValidPhoneNumber("05-434-2334"))
        XCTAssertFalse(isValidPhoneNumber("054342334"))
        XCTAssertFalse(isValidPhoneNumber("05-4342334"))
        XCTAssertFalse(isValidPhoneNumber("05-4342334-"))
        XCTAssertFalse(isValidPhoneNumber("-05434-2334"))
        XCTAssertFalse(isValidPhoneNumber("05434--2334"))
        XCTAssertFalse(isValidPhoneNumber("05-434-23-34"))
        XCTAssertFalse(isValidPhoneNumber("05-434-234"))
        XCTAssertFalse(isValidPhoneNumber("05 434 2334"))
        XCTAssertFalse(isValidPhoneNumber("james"))
        XCTAssertFalse(isValidPhoneNumber("전화번호부"))
        XCTAssertFalse(isValidPhoneNumber(""))
        XCTAssertFalse(isValidPhoneNumber(" 05-434-2334"))
        XCTAssertFalse(isValidPhoneNumber("05-434-2334 "))
        XCTAssertFalse(isValidPhoneNumber(" 05-434-2334 "))
    }

    func testPerformanceExample() throws {
        measure {}
    }

}
