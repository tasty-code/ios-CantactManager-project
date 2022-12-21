//
//  main.swift
//  CantactManager
//
//  Created by 박재우 on 2022/12/21.
//

import Foundation

func split(input: String, by: String) -> [String] {
    return input.components(separatedBy: by)
}

func run() {
    Message.pleaseInputContactData.printSelf(terminator: "")
    if let input = readLine() {
        let splitted = split(input: input, by: "/")
        guard splitted.count == 3 else {
            Message.inputError.printSelf(terminator: "\n")
            return
        }
        print(splitted)
    }
}

run()
