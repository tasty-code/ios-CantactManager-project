//
//  main.swift
//  CantactManager
//
//  Created by 박재우 on 2022/12/21.
//

import Foundation

func split(input: String) -> [String] {
    var splitted = input.components(separatedBy: " / ")
    if splitted.count != 3 {
        splitted = input.components(separatedBy: "/")
    }
    return splitted
}

func run() {
    Message.pleaseInputContactData.printSelf(terminator: "")
    if let input = readLine() {
        guard false == input.isEmpty else {
            Message.inputEmptyError.printSelf(terminator: "\n")
            return
        }
        let splitted = split(input: input)
        guard splitted.count == 3 else {
            Message.inputError.printSelf(terminator: "\n")
            return
        }
        print(splitted)
    }
}

run()
