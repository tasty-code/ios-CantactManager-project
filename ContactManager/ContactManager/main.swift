//
//  main.swift
//  CantactManager
//
//  Created by 박재우 on 2022/12/21.
//

import Foundation

func split(input: String) -> [String]? {
    var splitted = input.components(separatedBy: " / ")
    if splitted.count != 3 {
        splitted = input.components(separatedBy: "/")
        if splitted.count != 3 {
            return nil
        }
    }
    guard checkSplitted(splitted: splitted) else {
        return nil
    }
    return splitted
}

func checkSplitted(splitted: [String]) -> Bool {
    for infomation in splitted {
        guard !infomation.hasPrefix(" "), !infomation.hasSuffix(" ") else {
            return false
        }
    }
    return true
}

func getName(input: String) -> String? {
    guard !input.isEmpty else {
        return nil
    }
    guard input.allSatisfy({$0.isLowercase || $0.isUppercase || $0 == " "}) else {
        return nil
    }
    return input.components(separatedBy: [" "]).joined()
}

func getAge(input: String) -> UInt? {
    if input == "0" {
        return 0
    }
    guard !input.hasPrefix("0") else {
        return nil
    }
    guard let age = UInt(input), age < 1000 else {
        return nil
    }
    return age
}

func isValidPhoneNumber(input: String) -> Bool {
    let phoneNumber = input.components(separatedBy: ["-"])
    guard phoneNumber.count == 3 else {
        return false
    }
    for digit in phoneNumber {
        guard Int(digit) != nil else {
            return false
        }
    }
    guard input.count > 10 else {
        return false
    }
    return true
}

func run() {
    Message.pleaseInputContactData.printSelf()
    if let input = readLine() {
        guard false == input.isEmpty else {
            Message.inputEmptyError.printSelf()
            return
        }
        guard let splitted = split(input: input) else {
            Message.inputError.printSelf()
            return
        }
        guard let name = getName(input: splitted[0]) else {
            Message.getNameError.printSelf()
            return
        }
        guard let age = getAge(input: splitted[1]) else {
            Message.getAgeError.printSelf()
            return
        }
        guard isValidPhoneNumber(input: splitted[2]) else {
            Message.getPhoneNumberError.printSelf()
            return
        }
        let phoneNumber: String = splitted[2]
        print("입력한 정보는 \(age)세 \(name)(\(phoneNumber))입니다.")
    }
}

run()
