//
//  ErrorManage.swift
//  ios-cantact-manager
//
//  Created by 조용현 on 2022/12/22.
//

import Foundation

enum ValidInputError: String, Error {
    case notValidName = "이름"
    case notValidAge = "나이"
    case notValidTel = "연락처"
}

extension ValidInputError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .notValidName: return "입력한 이름정보가 잘못되었습니다. 입력 형식을 확인해주세요."
        case .notValidAge: return "입력한 나이정보가 잘못되었습니다. 입력 형식을 확인해주세요."
        case .notValidTel: return "입력한 연락처정보가 잘못되었습니다. 입력 형식을 확인해주세요."
        }
    }
}

// 정규표현식 충족 여부
var regexMatch: Bool = true
var regexMatch2: Bool = false

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
