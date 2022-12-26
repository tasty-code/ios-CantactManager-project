//
//  MyContactManager.swift
//  MyContactManager
//
//  Created by DONGWOOK SEO on 2022/12/26.
//

import Foundation

final class MyContactManager {
    
    private var runValue: Bool = true
    
    private var personDictionary = [String : Person]()
    
    func runProgram() {
        print(Message.greeting.rawValue, terminator: " ")
        let userInput = getUserInput()
        let vaildInput = isVaildInput(userInput: userInput)
        
        printResult(vaildInput)
    }
    
    private func getUserInput() -> [String]? {
        guard let userInput = readLine() else { return nil }
        let inputData = userInput.components(separatedBy: " ").joined()
        let input = inputData.split(separator: "/").map { String($0) }
        
        return input
    }
    
    private func isVaildInput(userInput: [String]?) -> [String]? {
        
        do {
            guard let input = userInput else { throw Errors.noUserInput }
            guard input.isEmpty == false else { throw Errors.noUserInput }
            guard input.count == 3 else { throw Errors.defaultError }
            
            let (age, number) = (input[1], input[2])
            
            try validateAgeForm(age)
            try validateNumberForm(number)
            
            return input
            
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    private func printResult(_ vaildInput: [String]?) {
        guard let vaildInput else { return }
        print("입력한 정보는 \(vaildInput[1])세 \(vaildInput[0]) (\(vaildInput[2]))입니다.")
    }
    
    private func validateAgeForm(_ age: String) throws {
        guard let ageInt = Int(age) else { throw Errors.wrongAge }
        guard ageInt < 1000 && ageInt > 0 else { throw Errors.wrongAge }
    }
    
    private func validateNumberForm(_ number: String) throws {
        
        let numberSplit = number.split(separator: "-").map { String($0) }
        if number.count < 10 || numberSplit.count < 3 {
            throw Errors.wrongPhoneNumber
        }
    }
    
    private func exitProgram() {
        runValue = false
        print("exit test")
    }
}
