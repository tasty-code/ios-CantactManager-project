//
//  MyContactManager.swift
//  MyContactManager
//
//  Created by DONGWOOK SEO on 2022/12/26.
//

import Foundation

final class MyContactManager {
    
    private var runValue: Bool = true
    
    func runProgram() {
        while isProgramRun() {
            print(Messages.greeting.rawValue, terminator: " ")
            let userInput = getUserInput()
            let validInput = setValidInput(userInput: userInput)
            
            if let description = inputDescription(of: validInput) {
                print(description)
            }
        }
    }
    
    private func trimming(of str:String) -> [String] {
        let unspacedString = str.components(separatedBy: " ").joined()
        let splitedString = unspacedString.split(separator: "/").map { String($0) }
        return splitedString
    }
    
    private func getUserInput() -> [String]? {
        guard let userInput = readLine() else { return nil }
        
        return trimming(of: userInput)
    }
    
    private func setValidInput(userInput: [String]?) -> [String]? {
        
        var validInput = userInput
        
        do {
            guard let input = userInput else { throw Errors.noUserInput }
            guard input.isEmpty == false else { throw Errors.noUserInput }
            guard input.count == 3 else { throw Errors.defaultError }
            
            let (age, number) = (input[1], input[2])
            
            validInput?[1] = try getValidAge(age)
            validInput?[2] = try getValidNumber(number)
            
            return validInput
            
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    private func inputDescription(of validInput: [String]?) -> String? {
        guard let validInput else { return nil }
        return "입력한 정보는 \(validInput[1])세 \(validInput[0]) (\(validInput[2]))입니다."
    }
    
    private func getValidAge(_ age: String) throws -> String {
        guard let ageInt = Int(age) else { throw Errors.wrongAge }
        guard ageInt <= Constants.maximumAge && ageInt >= Constants.minimumAge else { throw Errors.wrongAge }
        return String(ageInt)
    }
    
    private func getValidNumber(_ number: String) throws -> String{
        
        let numberSplit = number.split(separator: "-").map { String($0) }
        if number.count < 10 || numberSplit.count < 3 {
            throw Errors.wrongPhoneNumber
        }
        
        return number
    }
    
    private func isProgramRun() -> Bool {
        return runValue
    }
    
    private func terminateProgram() {
        runValue = false
    }
}