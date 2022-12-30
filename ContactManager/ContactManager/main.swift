//
//  main.swift
//  CantactManager
//
//  Created by 박재우 on 2022/12/21.
//

import Foundation

var manager = ContactManager()

func getLine() throws -> String? {
    guard let input = readLine() else {
        return nil
    }
    guard input.isEmpty == false else {
        throw ContactManagerError.emptyInput
    }
    return input
}

func createCommand() throws -> Command? {
    Message.pleaseInputMenu.printSelf()
    do {
        guard let input = try getLine() else {
            return Command.quit
        }
        guard let command = Command(rawValue: input) else {
            throw ContactManagerError.invalidCommand
        }
        return command
    } catch {
        print(error.localizedDescription)
    }
    return nil
}

manager.runProgram()
