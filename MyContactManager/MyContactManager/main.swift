//
//  main.swift
//  MyContactManager
//
//  Created by devxsby on 2022/12/21.
//

import Foundation

class MyContactManager {
    
    private(set) var runValue: Bool = true
    
    private var personDictionary = [String : Person]()
    
    func runProgram() {
        print(Message.greeting, terminator: " ")
        getUserInput()
    }
    
    private func getUserInput() {
        guard let userInput = readLine() else { return }
        let inputData = userInput.components(separatedBy: " ").joined()
        let input = inputData.split(separator: "/").map { String($0) }
        
        if input.count == 3 {
            let (name, age, number) = (input[0], input[1], input[2])
            if isVaildPersonType(name, age, number) {
                // TODO:- 유효한 데이터를 Person딕셔너리에 추가
            }
        } else if input.isEmpty {
            print(Message.noUserInput)
        } else {
            print(Message.defaultError)
        }
    }
    
    private func isVaildPersonType(_ name: String, _ age: String, _ number: String) -> Bool {
        if !vaildateAgeForm(age) {
            print(Message.wrongAge)
            return false
        } else if !validateNumberForm(number) {
            print(Message.wrongPhoneNumber)
            return false
        } else {
            print("name: \(name)")
            print("age: \(age)")
            print("number: \(number)")
            return true
        }
    }
    
    private func vaildateAgeForm(_ age: String) -> Bool {
        if age.count > 2 {
            return false
        }
        
        if let age = formatAge(with: age) {
            
            if age < 100 && age > 0 {
                return true
            } else {
                return false
            }
        }
        return false
    }
    
    private func formatAge(with age: String) -> Int? {
        var ageStr = age
        ageStr = ageStr.description.trimmingCharacters(in: ["0"])
        
        guard let ageInt = Int(ageStr) else { return nil }
        return ageInt
    }
    
    private func validateNumberForm(_ number: String) -> Bool {
        let numberSplit = number.split(separator: "-").map { String($0) }
        
        if number.count > 10 && numberSplit.count == 3 {
            return true
        } else {
            return false
        }
    }
    
    private func exitProgram() {
        runValue = false
        print("exit test")
    }
}

func main() {
    let myContactManager = MyContactManager()
    
    while myContactManager.runValue {
        myContactManager.runProgram()
    }
}

main()
