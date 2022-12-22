//
//  main.swift
//  CantactManager
//
//  Created by 박재우 on 2022/12/21.
//

import Foundation

var inputData: [String] = []

func split(input: String, separatedBy: String) -> [String] {
    return input.components(separatedBy: separatedBy)
}

func validInput() {
    Message.pleaseInputContactData.printSelf(terminator: "")
    if let input = readLine() {
        var splitted = split(input: input, separatedBy: " / ")
        if splitted.count != 3 {
            splitted = split(input: input, separatedBy: "/")
            guard splitted.count == 3 else {
                Message.inputError.printSelf(terminator: "\n")
                return
            }
        }
        inputData = splitted
    }
}

validInput()
print(inputData)
