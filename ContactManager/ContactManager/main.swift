//
//  main.swift
//  CantactManager
//
//  Created by 박재우 on 2022/12/21.
//

import Foundation

func split(input: String) throws -> (String, String, String) {
    var splitted = input.components(separatedBy: " / ")
    if splitted.count != 3 {
        splitted = input.components(separatedBy: "/")
        if splitted.count != 3 {
            throw ContactManagerError.invalidInput
        }
    }
    return (splitted[0], splitted[1], splitted[2])
}

func getName(input: String) throws -> String {
    guard !input.isEmpty else {
        throw ContactManagerError.invalidName
    }
    guard !input.hasPrefix(" "), !input.hasSuffix(" ") else {
        throw ContactManagerError.invalidName
    }
    guard input.allSatisfy({$0.isLowercase || $0.isUppercase || $0 == " "}) else {
        throw ContactManagerError.invalidName
    }
    return input.components(separatedBy: [" "]).joined()
}

func getAge(input: String) throws -> UInt {
    if input == "0" {
        return 0
    }
    guard !input.hasPrefix("0") else {
        throw ContactManagerError.invalidAge
    }
    guard let age = UInt(input), age < 1000 else {
        throw ContactManagerError.invalidAge
    }
    return age
}

func isValidPhoneNumber(_ phoneNumber: String) throws {
    guard phoneNumber.count > 10 else {
        throw ContactManagerError.invalidPhoneNumber
    }
    let digits = phoneNumber.components(separatedBy: ["-"])
    guard digits.count == 3 else {
        throw ContactManagerError.invalidPhoneNumber
    }
    for digit in digits {
        guard Int(digit) != nil else {
            throw ContactManagerError.invalidPhoneNumber
        }
    }
}

func getLine(messageType: Message) throws -> String {
    messageType.printSelf()
    guard let input = readLine(), !input.isEmpty else {
        throw ContactManagerError.emptyInput
    }
    return input
}

func run() {
    do {
        let input: String = try getLine(messageType: .pleaseInputContactData)
        let raw: (name: String, age: String, phoneNumber: String) = try split(input: input)
        let name: String = try getName(input: raw.name)
        let age: UInt = try getAge(input: raw.age)
        try isValidPhoneNumber(raw.phoneNumber)
        let phoneNumber: String = raw.phoneNumber
        print("입력한 정보는 \(age)세 \(name)(\(phoneNumber))입니다.")
    } catch {
        print(error.localizedDescription)
    }
}

run()
