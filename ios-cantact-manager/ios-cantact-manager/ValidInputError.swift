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
    case notValidInput
}

extension ValidInputError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .notValidName: return "입력한 이름정보가 잘못되었습니다. 입력 형식을 확인해주세요."
        case .notValidAge: return "입력한 나이정보가 잘못되었습니다. 입력 형식을 확인해주세요."
        case .notValidTel: return "입력한 연락처정보가 잘못되었습니다. 입력 형식을 확인해주세요."
        case .notValidInput: return "아무것도 입력되지 않았습니다. 입력 형식을 확인해주세요."
        }
    }
}


