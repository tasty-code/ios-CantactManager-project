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
            print("name: \(name)")
            print("age: \(age)")
            print("number: \(number)")
            if !vaildateAgeForm(age) {
                print(Message.wrongAge)
            } else if !validateNumberForm(number) {
                print(Message.wrongPhoneNumber)
            }
        } else if input.isEmpty {
            print(Message.noUserInput)
        } else {
            print(Message.defaultError)
        }
    }
    
    private func vaildateAgeForm(_ age: String) -> Bool {
        var ageString = age
        while ageString.description.hasPrefix("0") {
            ageString = ageString.description.trimmingCharacters(in: ["0"])
        }
        
        guard let age = Int(ageString) else { return false }
        
        if age < 100 && age > 0 {
            print(age)
            return true
        } else {
            print(age)
            return false
        }
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
