//
//  Errors.swift
//  MyContactManager
//
//  Created by DONGWOOK SEO on 2022/12/27.
//

import Foundation

enum Errors: LocalizedError {
    case wrongAge
    case wrongPhoneNumber
    case noUserInput
    case defaultError
    
    var errorDescription: String? {
        switch self {
        case .wrongAge:
            return "입력한 나이정보가 잘못되었습니다. 입력 형식을 확인해주세요."
        case .wrongPhoneNumber:
            return "입력한 연락처정보가 잘못되었습니다. 입력 형식을 확인해주세요."
        case .noUserInput:
            return "아무것도 입력되지 않았습니다. 입력 형식을 확인해주세요."
        case .defaultError:
            return "입력한 정보가 잘못되었습니다. 입력 형식을 확인해주세요."
        }
    }
}
