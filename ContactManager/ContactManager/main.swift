//
//  main.swift
//  CantactManager
//
//  Created by 박재우 on 2022/12/21.
//

import Foundation

var manager = ContactManager()

func getLine(messageType: Message) throws -> String? {
    messageType.printSelf()
    guard let input = readLine() else {
        return nil
    }
    guard !input.isEmpty else {
        throw ContactManagerError.emptyInput
    }
    return input
}

func getCommand() -> Command? {
    do {
        guard let input = try getLine(messageType: .pleaseInputMenu) else {
            return Command.quit
        }
        guard let command = Command(rawValue: input) else {
            return Command.invilidCommand
        }
        return command
    } catch {
        print(error.localizedDescription)
    }
    return nil
}

manager.runProgram()
