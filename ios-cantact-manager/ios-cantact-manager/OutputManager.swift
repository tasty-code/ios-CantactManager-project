//
//  OutputManager.swift
//  ios-cantact-manager
//
//  Created by 조용현 on 2022/12/27.
//

import Foundation

enum OutputManager: String {
    case inputInfoMessage = "연락처 정보를 입력해주세요 : "
    case inputMenuMessage = "1) 연락처 추가 2) 연락처 목록보기 3) 연락처 검색 x) 종료\n메뉴를 선택해주세요 : "
    case invalidMenuMessage = "선택이 잘못되었습니다 확인 후 다시 입력해주세요."
    case stopSystemMessage = "\n[프로그램 종료]"
    case invalidInputMessage = "입력한 정보가 잘못되었습니다. 입력 형식을 확인해주세요."
    case invalidAgeMessage = "입력한 나이정보가 잘못되었습니다. 입력 형식을 확인해주세요."
    case invalidTelMessage = "입력한 연락처정보가 잘못되었습니다. 입력 형식을 확인해주세요."
}

extension OutputManager: CustomStringConvertible {
    var description: String {
        return self.rawValue
    }
    
    static func printGuideMessage(_ text: OutputManager) {
        switch text {
        case .inputInfoMessage, .inputMenuMessage, .stopSystemMessage:
            print(text.description, terminator: "")
        default:
            print(text.description)
        }
    }
    static func printProfileMessage(_ profile: Profile) {
        print("입력한 정보는 \(profile.age)세 \(profile.name)(\(profile.tel))입니다.")
    }
}
