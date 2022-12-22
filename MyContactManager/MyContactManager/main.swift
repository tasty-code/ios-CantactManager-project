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
        print(StringLiterals.enterMesssage, terminator: " ")
        getUserInput()
    }
    
    private func getUserInput() {
        guard let userInput = readLine() else { return }
        let inputData = userInput.split(separator: " ")
        if inputData.isEmpty {
            print(StringLiterals.noInputMessage)
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
