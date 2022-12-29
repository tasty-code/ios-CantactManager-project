//
//  OutputManager.swift
//  ios-cantact-manager
//
//  Created by 조용현 on 2022/12/27.
//

import Foundation

enum OutputManager: String {
    case inputInfo = "연락처 정보를 입력해주세요 : "
    case inputMenu = "1) 연락처 추가 2) 연락처 목록보기 3) 연락처 검색 x) 종료\n메뉴를 선택해주세요 : "
    case invalidMenu = "선택이 잘못되었습니다 확인 후 다시 입력해주세요."
    case stopSystem = "\n[프로그램 종료]"
    case invalidInput = "입력한 정보가 잘못되었습니다. 입력 형식을 확인해주세요."
    case invalidAge = "입력한 나이정보가 잘못되었습니다. 입력 형식을 확인해주세요."
    case invalidTel = "입력한 연락처정보가 잘못되었습니다. 입력 형식을 확인해주세요."
    case inputName = "연락처에서 찾을 이름을 입력해주세요 : "
}

extension OutputManager: CustomStringConvertible {
    var description: String {
        return self.rawValue
    }
    
    static func printMessage(_ text: OutputManager) {
        switch text {
        case .inputInfo, .inputMenu, .stopSystem, .inputName:
            print(text.description, terminator: "")
        default:
            print(text.description)
        }
    }
    static func printProfile(_ profile: Profile) {
        print("입력한 정보는 \(profile.age)세 \(profile.name)(\(profile.tel))입니다.")
    }
    static func printNoMatchingData(name: String) {
        print("연락처에 \(name) 이(가) 없습니다.")
    }
}
