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
    return splitted
}

func getName(input: String) -> String? {
    guard !input.isEmpty else {
        return nil
    }
    guard !input.hasPrefix(" "), !input.hasSuffix(" ") else {
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

func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
    guard phoneNumber.count > 10 else {
        return false
    }
    let digits = phoneNumber.components(separatedBy: ["-"])
    guard digits.count == 3 else {
        return false
    }
    for digit in digits {
        guard Int(digit) != nil else {
            return false
        }
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
        guard isValidPhoneNumber(splitted[2]) else {
            Message.getPhoneNumberError.printSelf()
            return
        }
        let phoneNumber: String = splitted[2]
        print("입력한 정보는 \(age)세 \(name)(\(phoneNumber))입니다.")
    }
}

run()
