//
//  InputManager.swift
//  ios-cantact-manager
//
//  Created by J.E on 2022/12/21.
//

import Foundation

struct InputManager {
    let inputInfoMessage = "연락처 정보를 입력해주세요 : "

    func inputInfo() throws -> [String] {
        print(inputInfoMessage)
        
        let input = readLine()
        guard let input = input, input != "" else { throw ValidInputError.notValidInput}
        let splitInput = input.components(separatedBy: "/").map { $0.replacingOccurrences(of: " ", with: "") }
        
        return [splitInput[0], splitInput[1], splitInput[2]]
    }

    func checkAge(_ age: String) throws -> String {
        let ageRegex = "^[0-9]{1,3}$"
        let regexTest = NSPredicate(format: "SELF MATCHES %@", ageRegex)
        
        guard regexTest.evaluate(with: age) else { throw ValidInputError.notValidAge }
        
        return age
    }

    func checkTel(_ tel: String) throws -> String {
        guard (tel.filter { $0 == "-" }).count == 2 else { throw ValidInputError.notValidTel }
        let tel = tel.filter { $0 != "-" }
        
        let telRegex = "^[0-9]{9,}$"
        let regexTest = NSPredicate(format: "SELF MATCHES %@", telRegex)
        
        guard regexTest.evaluate(with: tel) else { throw ValidInputError.notValidTel }
        
        return tel
    }
}
