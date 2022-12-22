//
//  InputManager.swift
//  ios-cantact-manager
//
//  Created by J.E on 2022/12/21.
//

import Foundation

struct InputManager {
    let inputInfoMessage = "연락처 정보를 입력해주세요 : "
    
    var regexMatch: Bool = true
    var regexMatch2: Bool = false
    
    func printErrorMessage(_ data: String) {
        print("입력한 \(data) 정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
    }
    
    func inputInfo() throws -> [String] {
        print(inputInfoMessage)
        let input = readLine()
        guard let input = input, input != "" else { throw ValidInputError.notValidInput}
        let splitInput = input.components(separatedBy: "/").map { $0.replacingOccurrences(of: " ", with: "") }
        return [splitInput[0], splitInput[1], splitInput[2]]
    }
    
    func checkName(_ name: String) throws -> String {
        guard !regexMatch else { return name }
        throw ValidInputError.notValidName
    }

    func checkAge(_ age: String) throws -> String {
        guard !regexMatch2 else { return age }
        throw ValidInputError.notValidAge
    }

    func checkTel(_ tel: String) throws -> String {
        guard !regexMatch else { return tel }
        throw ValidInputError.notValidTel
    }
}

