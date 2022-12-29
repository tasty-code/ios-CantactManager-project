//
//  InputEditor.swift
//  MyContactManager
//
//  Created by devxsby on 2022/12/28.
//

import Foundation

struct InputEditor {
    
    let validator = Validator()
    let outputEditor = OutputEditor()
    
    func getUserInput() throws -> String {
        guard let userInput = readLine() else {
            throw Errors.readFail // 시스템에러 검증
        }
        return userInput
    }
    
    func getContactInfo() throws -> UserInputModel {
        let userInput = try getUserInput()
        
        let isEmpty = validator.checkInputEmpty(with: userInput) // 비어있는거 검증
        
        if isEmpty {
            throw Errors.noUserInput
        }
        
        let trimmedData = trimming(of: userInput)
        return convertToUserInputModel(with: trimmedData)
    }
    
    func selectMenu() throws -> Bool {
        let userInput = try getUserInput()
        
        let menu = Menu(rawValue: userInput)
        
        // 스위치문 다시 ProgramManager으로 뺄 것.!!!!
        switch menu {
        case .add:
            outputEditor.askContactInfo()
            do {
                let userInput = try getContactInfo()
                let person = try requestValidation(with: userInput)
                outputEditor.printResult(with: person)
            } catch {
                print(error.localizedDescription)
                return true
            }
        case .showList:
            return true
        case .search:
            return true
        case .exit:
            outputEditor.printTerminateProgram()
            return false
        default:
            outputEditor.printWrongSelect()
            return true
        }
        return true
    }
    
    
    
    
    
    func trimming(of str: String) -> [String] {
        let unspacedString = str.components(separatedBy: " ").joined()
        let splitedString = unspacedString.split(separator: "/").map { String($0) }
        return splitedString
    }
    
    func convertToUserInputModel(with str: [String]) -> UserInputModel {
        return UserInputModel(name: str[0], age: str[1], phoneNum: str[2])
    }
    
    func requestValidation(with model: UserInputModel) throws -> Person {
        do {
            let person = try validator.checkValidAgeAndNum(input: model)
            return person
        } catch {
            throw error
        }
    }
}
