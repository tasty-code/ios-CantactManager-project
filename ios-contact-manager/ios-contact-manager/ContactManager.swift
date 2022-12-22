//
//  ContactManager.swift
//  ios-contact-manager
//
//  Created by 송선진 on 2022/12/22.
//

import Foundation

final class ContactManager {
    static let shared = ContactManager()
    private init() { }
    
    func run() {
        do {
            let input = try IOManager.getInput()
            let a = try parse(input)
            print(a.age, a.name, a.phone)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func parse(_ input: String) throws -> (name: String, age: String, phone: String) {
        let splited: [String]
        if input.contains(" / ") {
            splited = input.components(separatedBy: " / ")
        } else {
            splited = input.components(separatedBy: "/")
        }
        guard splited.count == 3 else {
            throw IOError.inputFormatError
        }
        return (splited[0], splited[1], splited[2])
    }
    
}
