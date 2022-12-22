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
