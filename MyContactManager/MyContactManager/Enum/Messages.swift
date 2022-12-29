//
//  Messages.swift
//  MyContactManager
//
//  Created by devxsby on 2022/12/21.
//

import Foundation

enum Messages: String {
    case menu = "1) 연락처 추가 2) 연락처 목록보기 3) 연락처 검색 x) 종료\n메뉴를 선택해주세요 :"
    case enterInfo = "연락처 정보를 입력해주세요 :"
    case wrongSelect = "선택이 잘못었습니다 확인 후 다시 입력해주세요."
    case terminateProgram = "\n[프로그램 종료]"
}
