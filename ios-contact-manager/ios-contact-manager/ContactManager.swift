//
//  ContactManager.swift
//  ios-contact-manager
//
//  Created by 송선진 on 2022/12/22.
//

import Foundation

typealias InfoInput = (name: String, age: String, phone: String)

final class ContactManager {
    static let shared = ContactManager()
    private init() { }
    
    func run() {
        do {
            IOManager.sendOutput(type: .menu, contents: StringLiteral.start)
            let input = try IOManager.getInput()
            let parsedInfoInput = try parse(input)
            
            let userInfo = try UserInfo(input: parsedInfoInput)
            IOManager.sendOutput(type: .infomation, contents: StringLiteral.infoPrint(of: userInfo))
        } catch {
            IOManager.sendOutput(type: .error, contents: error.localizedDescription)
        }
    }
    
    private func parse(_ input: String) throws -> InfoInput {
        let splited: [String]
        if input.contains(" / ") {
            splited = input.components(separatedBy: " / ")
        } else if input.contains(" /") || input.contains("/ ") {
            throw IOError.invalidInputFormat
        } else {
            splited = input.components(separatedBy: "/")
        }
        guard splited.count == 3 else {
            throw IOError.invalidInputFormat
        }
        return (splited[0], splited[1], splited[2])
    }
    
}
