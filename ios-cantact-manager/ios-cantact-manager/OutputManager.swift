//
//  OutputManager.swift
//  ios-cantact-manager
//
//  Created by 조용현 on 2022/12/27.
//

import Foundation

struct OutputManager {
    private let inputInfoMessage = "연락처 정보를 입력해주세요 : "
    private let inputMenuMessage = "1) 연락처 추가 2) 연락처 목록보기 3) 연락처 검색 x) 종료\n메뉴를 선택해주세요 : "
    private let invalidMenuMessage = "선택이 잘못되었습니다 확인 후 다시 입력해주세요."
    private let stopSystemMessage = "\n[프로그램 종료]"
    private let invalidInputMessage = "입력한 정보가 잘못되었습니다. 입력 형식을 확인해주세요."
    private let invalidAgeMessage = "입력한 나이정보가 잘못되었습니다. 입력 형식을 확인해주세요."
    private let invalidTelMessage = "입력한 연락처정보가 잘못되었습니다. 입력 형식을 확인해주세요."
    
    func printInputInfo() {
        print(inputInfoMessage, terminator: "")
    }
    
    func printInputMenu() {
        print(inputMenuMessage, terminator: "")
    }
    
    func printInvalidMenu() {
        print(invalidMenuMessage)
    }
    
    func printStopSystem() {
        print(stopSystemMessage, terminator: "")
    }
    
    func printInvalidInput() {
        print(invalidInputMessage)
    }
    
    func printInvalidAge() {
        print(invalidAgeMessage)
    }
    
    func printInvalidTel() {
        print(invalidTelMessage)
    }
    
    func printUserInput(_ profile: Profile) {
        print("입력한 정보는 \(profile.age)세 \(profile.name)(\(profile.tel))입니다.")
    }

}
