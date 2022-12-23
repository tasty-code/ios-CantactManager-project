//
//  Message.swift
//  CantactManager
//
//  Created by 박재우 on 2022/12/21.
//

import Foundation

enum Message: String {
    case pleaseInputContactData = "연락처 정보를 입력해주세요 : "
    case inputError = "입력이 잘못되었습니다. 입력 형식을 확인해주세요."
    case inputEmptyError = "아무것도 입력되지 않았습니다. 입력 형식을 확인해주세요."
    case getNameError = "입력한 이름정보가 잘못되었습니다. 입력 형식을 확인해주세요."
    case getAgeError = "입력한 나이정보가 잘못되었습니다. 입력 형식을 확인해주세요."
    case getPhoneNumberError = "입력한 연락처정보가 잘못되었습니다. 입력 형식을 확인해주세요."
}

extension Message {
    func printSelf() {
        switch self {
        case .pleaseInputContactData: print(self.rawValue, terminator: "")
        default: print(self.rawValue)
        }
    }
}
