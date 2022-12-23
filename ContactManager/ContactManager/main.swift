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
        guard infomation.firstString != " ", infomation.lastString != " " else {
            return false
        }
    }
    return true
}

func getName(input: String) -> String? {
    return input
}

func getAge(input: String) -> Int? {
    guard input[input.startIndex] != "0" else {
        return nil
    }
    guard let age = Int(input) else {
        return nil
    }
    guard age > 0, age < 1000 else {
        return nil
    }
    return age
}

func getPhoneNumber(input: String) -> String? {
    return input
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
        guard let phoneNumber = getPhoneNumber(input: splitted[2]) else {
            Message.getPhoneNumberError.printSelf()
            return
        }
        print("입력한 정보는 \(age)세 \(name)(\(phoneNumber))입니다.")
    }
}

run()

extension String {
    var lastString: String {
        guard !self.isEmpty else {
            return self
        }
        let lastIndex = self.index(before: self.endIndex)
        return String(self[lastIndex])
    }

    var firstString: String {
        guard !self.isEmpty else {
            return self
        }
        let firstIndex = self.startIndex
        return String(self[firstIndex])
    }
}
