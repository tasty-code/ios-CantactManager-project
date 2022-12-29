//
//  Message.swift
//  CantactManager
//
//  Created by 박재우 on 2022/12/21.
//

import Foundation

enum Message: String {
    case pleaseInputContactData = "연락처 정보를 입력해주세요 :"
    case pleaseInputMenu = """
    1) 연락처 추가 2) 연락처 목록보기 3) 연락처 검색 x) 종료
    메뉴를 선택해주세요 :
    """
    case quit = "[프로그램 종료]"
}

extension Message {
    func printSelf() {
        print(self.rawValue, terminator: " ")
    }
}
