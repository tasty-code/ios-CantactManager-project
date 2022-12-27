//
//  ContactManagerTest.swift
//  ContactManagerTest
//
//  Created by 박재우 on 2022/12/22.
//

import XCTest

final class ContactManagerTest: XCTestCase {
    func testSplit() throws {
        var splitted: (name: String, age: String, phoneNumber: String) = try split(input: "james/30/123-1234-1234")
        XCTAssertEqual(splitted.name, "james")
        XCTAssertEqual(splitted.age, "30")
        XCTAssertEqual(splitted.phoneNumber, "123-1234-1234")

        splitted = try split(input: "james / 30 / 123-1234-1234")
        XCTAssertEqual(splitted.name, "james")
        XCTAssertEqual(splitted.age, "30")
        XCTAssertEqual(splitted.phoneNumber, "123-1234-1234")

        splitted = try split(input: "james / 30 / ")
        XCTAssertEqual(splitted.name, "james")
        XCTAssertEqual(splitted.age, "30")
        XCTAssertEqual(splitted.phoneNumber, "")

        splitted = try split(input: "james/30/")
        XCTAssertEqual(splitted.name, "james")
        XCTAssertEqual(splitted.age, "30")
        XCTAssertEqual(splitted.phoneNumber, "")

        XCTAssertThrowsError(try split(input: "")) { error in
            XCTAssertEqual(error as? ContactManagerError, ContactManagerError.invalidInput)
        }
        XCTAssertThrowsError(try split(input: "james/30")) { error in
            XCTAssertEqual(error as? ContactManagerError, ContactManagerError.invalidInput)
        }
        XCTAssertThrowsError(try split(input: "james / 30 / 123-1234-1234 / 40")) { error in
            XCTAssertEqual(error as? ContactManagerError, ContactManagerError.invalidInput)
        }
        XCTAssertThrowsError(try split(input: "james/30/123-1234-1234/40")) { error in
            XCTAssertEqual(error as? ContactManagerError, ContactManagerError.invalidInput)
        }
    }

    func test이름() {
        XCTAssertEqual(try getName(input: "james"), "james")
        XCTAssertEqual(try getName(input: "jam  es"), "james")
        XCTAssertThrowsError(try getName(input: "한글의이름")) { error in
            XCTAssertEqual(error as? ContactManagerError, ContactManagerError.invalidName)
        }
        XCTAssertThrowsError(try getName(input: "")) { error in
            XCTAssertEqual(error as? ContactManagerError, ContactManagerError.invalidName)
        }
        XCTAssertThrowsError(try getName(input: " james ")) { error in
            XCTAssertEqual(error as? ContactManagerError, ContactManagerError.invalidName)
        }
        XCTAssertThrowsError(try getName(input: " james")) { error in
            XCTAssertEqual(error as? ContactManagerError, ContactManagerError.invalidName)
        }
        XCTAssertThrowsError(try getName(input: "james ")) { error in
            XCTAssertEqual(error as? ContactManagerError, ContactManagerError.invalidName)
        }
    }

    func test나이() {
        XCTAssertEqual(try getAge(input: "23"), 23)
        XCTAssertEqual(try getAge(input: "999"), 999)
        XCTAssertEqual(try getAge(input: "0"), 0)
        XCTAssertThrowsError(try getAge(input: "000")) { error in
            XCTAssertEqual(error as? ContactManagerError, ContactManagerError.invalidAge)
        }
        XCTAssertThrowsError(try getAge(input: "1234")) { error in
            XCTAssertEqual(error as? ContactManagerError, ContactManagerError.invalidAge)
        }
        XCTAssertThrowsError(try getAge(input: "-3")) { error in
            XCTAssertEqual(error as? ContactManagerError, ContactManagerError.invalidAge)
        }
        XCTAssertThrowsError(try getAge(input: "010")) { error in
            XCTAssertEqual(error as? ContactManagerError, ContactManagerError.invalidAge)
        }
        XCTAssertThrowsError(try getAge(input: " 10 ")) { error in
            XCTAssertEqual(error as? ContactManagerError, ContactManagerError.invalidAge)
        }
        XCTAssertThrowsError(try getAge(input: " 10")) { error in
            XCTAssertEqual(error as? ContactManagerError, ContactManagerError.invalidAge)
        }
        XCTAssertThrowsError(try getAge(input: "10 ")) { error in
            XCTAssertEqual(error as? ContactManagerError, ContactManagerError.invalidAge)
        }
    }

    func test전화번호() {
        XCTAssertNoThrow(try isValidPhoneNumber("05-434-2334"))
        XCTAssertThrowsError(try isValidPhoneNumber("054342334")) { error in
            XCTAssertEqual(error as? ContactManagerError, ContactManagerError.invalidPhoneNumber)
        }
        XCTAssertThrowsError(try isValidPhoneNumber("05-4342334")) { error in
            XCTAssertEqual(error as? ContactManagerError, ContactManagerError.invalidPhoneNumber)
        }
        XCTAssertThrowsError(try isValidPhoneNumber("05-4342334-")) { error in
            XCTAssertEqual(error as? ContactManagerError, ContactManagerError.invalidPhoneNumber)
        }
        XCTAssertThrowsError(try isValidPhoneNumber("-05434-2334")) { error in
            XCTAssertEqual(error as? ContactManagerError, ContactManagerError.invalidPhoneNumber)
        }
        XCTAssertThrowsError(try isValidPhoneNumber("05434--2334")) { error in
            XCTAssertEqual(error as? ContactManagerError, ContactManagerError.invalidPhoneNumber)
        }
        XCTAssertThrowsError(try isValidPhoneNumber("05-434-23-34")) { error in
            XCTAssertEqual(error as? ContactManagerError, ContactManagerError.invalidPhoneNumber)
        }
        XCTAssertThrowsError(try isValidPhoneNumber("05-434-234")) { error in
            XCTAssertEqual(error as? ContactManagerError, ContactManagerError.invalidPhoneNumber)
        }
        XCTAssertThrowsError(try isValidPhoneNumber("05 434 2334")) { error in
            XCTAssertEqual(error as? ContactManagerError, ContactManagerError.invalidPhoneNumber)
        }
        XCTAssertThrowsError(try isValidPhoneNumber("james")) { error in
            XCTAssertEqual(error as? ContactManagerError, ContactManagerError.invalidPhoneNumber)
        }
        XCTAssertThrowsError(try isValidPhoneNumber("전화번호부")) { error in
            XCTAssertEqual(error as? ContactManagerError, ContactManagerError.invalidPhoneNumber)
        }
        XCTAssertThrowsError(try isValidPhoneNumber("")) { error in
            XCTAssertEqual(error as? ContactManagerError, ContactManagerError.invalidPhoneNumber)
        }
        XCTAssertThrowsError(try isValidPhoneNumber(" 05-434-2334")) { error in
            XCTAssertEqual(error as? ContactManagerError, ContactManagerError.invalidPhoneNumber)
        }
        XCTAssertThrowsError(try isValidPhoneNumber("05-434-2334 ")) { error in
            XCTAssertEqual(error as? ContactManagerError, ContactManagerError.invalidPhoneNumber)
        }
        XCTAssertThrowsError(try isValidPhoneNumber(" 05-434-2334 ")) { error in
            XCTAssertEqual(error as? ContactManagerError, ContactManagerError.invalidPhoneNumber)
        }
    }

    func testPerformanceExample() throws {
        measure {}
    }

}
