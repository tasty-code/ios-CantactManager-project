//
//  main.swift
//  ios-cantact-manager
//
//  Created by 조용현 on 2022/12/21.
//

import Foundation

enum ValidInputError: String, Error {
    case notValidName = "이름"
    case notValidAge = "나이"
    case notValidContact = "연락처"
}

// 정규표현식 충족 여부
var regexMatch: Bool = {
    return true
}

func errorMessage(_ data: String) -> String {
    "입력한 \(data) 정보가 잘못되었습니다. 입력 형식을 확인해주세요."
}

func checkName(_ name: String) throws -> String {
    guard !regexMatch else { return name }
    print(errorMessage(name))
    throw ValidInputError.notValidName
}

func checkAge(_ age: String) throws -> String {
    guard !regexMatch else { return age }
    print(errorMessage(age))
    throw ValidInputError.notValidAge
}

func checkContact(_ contact: String) throws -> String {
    guard !regexMatch else { return contact }
    print(errorMessage(contact))
    throw ValidInputError.notValidContact
}

enum Profile {
    case name(type: String = "이름", data: String?, form: String = "regex")
    case age(type: String = "나이", data: String?, form: String = "regex")
    case contact(type: String = "연락처", data: String?, form: String = "regex")
}
