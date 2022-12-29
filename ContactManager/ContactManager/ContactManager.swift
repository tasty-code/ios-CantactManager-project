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
    private var contacts: Set<Contact> = []
    private var state: State = .continued

    private mutating func execute(command: Command) {
        switch command {
        case .addContact:
            addContact()
        case .showContacts:
            showContact()
        case .searchContact:
            searchContact()
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

    mutating func addContact() {
        guard let contact = getContact() else {
            return
        }
        print("입력한 정보는 \(contact.age)세 \(contact.name)(\(contact.phoneNumber))입니다.")
        self.contacts.insert(contact)
    }

    private func showContact() {
        let contacts = self.contacts.sorted {
            ($0.name, $1.age) > ($1.name, $0.age)
        }
        for contact in contacts {
            print("- \(contact.name) / \(contact.age) / \(contact.phoneNumber)")
        }
    }

    private func searchContact() {
        do {
            guard let name = try getLine(messageType: .searchContact) else {
                return
            }
            let contacts = self.contacts.filter { contact in
                contact.name == name
            }
            guard !contacts.isEmpty else {
                print("연락처에 \(name) 이(가) 없습니다.")
                return
            }
            for contact in contacts {
                print("- \(contact.name) / \(contact.age) / \(contact.phoneNumber)")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
