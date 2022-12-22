//
//  InputManager.swift
//  ios-cantact-manager
//
//  Created by J.E on 2022/12/21.
//

import Foundation

struct InputManager {
    let inputInfoMessage = "연락처 정보를 입력해주세요 : "
    
    func printErrorMessage(_ data: String) {
        print("입력한 \(data) 정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
    }
    
    func inputInfo() -> [String] {
        print(inputInfoMessage)
//        var inputs: (String?, String?, String?)
        guard let input = readLine() else { return ["1"] }
        let splitInput = input.components(separatedBy: "/").map { $0.replacingOccurrences(of: " ", with: "") }
//        do {
//            try checkName(splitInput[0])
//        } catch ValidInputError.notValidName {
//            printErrorMessage("이름")
//        }
//        do {
//            try checkAge(splitInput[1])
//        } catch ValidInputError.notValidAge {
//            printErrorMessage("나이")
//        }
//        do {
//            try checkTel(splitInput[2])
//        } catch ValidInputError.notValidTel {
//            printErrorMessage("연락처")
//        }
        return splitInput
//        ((try? checkName(splitInput[0])) ?? "", (try? checkAge(splitInput[1])) ?? "", (try? checkTel(splitInput[2]))  ?? "")
//        return inputs
    }
}

