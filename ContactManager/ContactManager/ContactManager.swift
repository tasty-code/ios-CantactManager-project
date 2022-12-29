//
//  ContactManager.swift
//  ContactManager
//
//  Created by 박재우 on 2022/12/29.
//

import Foundation

enum Command: String {
    case addContact = "1"
    case showContacts = "2"
    case searchContact = "3"
    case quit = "x"
    case invilidCommand
}

enum State {
    case continued
    case quit
}

struct ContactManager {
    private var state: State = .continued

    private mutating func execute(command: Command) {
        switch command {
        case .addContact:
            addContact()
        case .showContacts:
            return
        case .searchContact:
            return
        case .quit:
            self.state = .quit
        case .invilidCommand:
            print(ContactManagerError.invalidCommand.localizedDescription)
        }
    }

    mutating func runProgram() {
        while self.state == .continued {
            defer {
                print()
            }
            guard let command = getCommand() else {
                continue
            }
            execute(command: command)
        }
        print(Message.quit.rawValue)
    }
}
