//
//  Message.swift
//  CantactManager
//
//  Created by 박재우 on 2022/12/21.
//

import Foundation

enum Message: String {
    case pleaseInputContactData = "연락처 정보를 입력해주세요 :"
}

extension Message {
    func printSelf() {
        print(self.rawValue, terminator: " ")
    }
}
