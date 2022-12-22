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
    case notValidTel = "연락처"
}

// 정규표현식 충족 여부
var regexMatch: Bool = true
var regexMatch2: Bool = false
//{
//    return true
//}

func checkName(_ name: String) throws -> String {
    guard !regexMatch else { return name }
    print(InputManager().printErrorMessage(name))
    throw ValidInputError.notValidName
}

func checkAge(_ age: String) throws -> String {
    guard !regexMatch2 else { return age }
    print(InputManager().printErrorMessage(age))
    throw ValidInputError.notValidAge
}

func checkTel(_ tel: String) throws -> String {
    guard !regexMatch else { return tel }
    print(InputManager().printErrorMessage(tel))
    throw ValidInputError.notValidTel
}

//enum Profile {
//    case name(type: String = "이름", data: String?, form: String = "regex")
//    case age(type: String = "나이", data: String?, form: String = "regex")
//    case contact(type: String = "연락처", data: String?, form: String = "regex")
//}

let info = ContactManageSystem()
info.addProfile()


