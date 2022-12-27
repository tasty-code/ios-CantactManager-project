//
//  Errors.swift
//  MyContactManager
//
//  Created by DONGWOOK SEO on 2022/12/27.
//

import Foundation

enum Errors: String, LocalizedError {
    case wrongAge = "입력한 나이정보가 잘못되었습니다. 입력 형식을 확인해주세요."
    case wrongPhoneNumber = "입력한 연락처정보가 잘못되었습니다. 입력 형식을 확인해주세요."
    case defaultError = "입력한 정보가 잘못되었습니다. 입력 형식을 확인해주세요."
    case noUserInput = "아무것도 입력되지 않았습니다. 입력 형식을 확인해주세요."
    
    var errorDescription: String? {
        return self.rawValue
    }
}
