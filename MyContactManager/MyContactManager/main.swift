//
//  main.swift
//  MyContactManager
//
//  Created by devxsby on 2022/12/21.
//

import Foundation

class MyContactManager {
    
    private(set) var runValue: Bool = true
    
    private var personDictionary = PersonManager()
        
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
            if !isIntType(age) {
                print(Message.wrongAge)
            }
        } else if input.isEmpty {
            print(Message.noUserInput)
        } else {
            print(Message.defaultError)
        }
    }
    
    private func isIntType(_ input: String) -> Bool {
        guard let _ = Int(input) else { return false }
        return true
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
