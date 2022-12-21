//
//  InputManager.swift
//  ios-cantact-manager
//
//  Created by J.E on 2022/12/21.
//

import Foundation

struct InputManager {
    let inputInfoMessage = "연락처 정보를 입력해주세요 : "
    
    func inputInfo() -> (String, String, String) {
        print(inputInfoMessage)
        
        guard let input = readLine() else { return ("1", "2", "3") }
        var splitInput = input.split(separator: "/").map { String($0) }
        return (splitInput[0], splitInput[1], splitInput[2])
    }
}

