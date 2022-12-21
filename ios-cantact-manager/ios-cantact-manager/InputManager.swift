//
//  InputManager.swift
//  ios-cantact-manager
//
//  Created by J.E on 2022/12/21.
//

import Foundation

struct InputManager {
    let inputInfoMessage = "연락처 정보를 입력해주세요 : "
    
    func inputInfo() {
        print(inputInfoMessage)
        
        guard let input = readLine() else { return }
        var splitInput = input.split(separator: "/")
        print(splitInput)
    }
}
