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
    
    let inputPattern = #"^.+\b(?<sep>( \/ )|(\/))(\b[^\s]+\b)\k<sep>(\b[^\s]+)$"#
    
    func run() {
        do {
            IOManager.sendOutput(type: .menu, contents: StringLiteral.menu)
            let input = try IOManager.getInput()
            let parsedInfoInput = try parse(input)
            
            let userInfo = try UserInfo(input: parsedInfoInput)
            IOManager.sendOutput(type: .infomation, contents: StringLiteral.infoPrint(of: userInfo))
        } catch {
            IOManager.sendOutput(type: .error, contents: error.localizedDescription)
        }
    }
    
    private func parse(_ input: String) throws -> InfoInput {
        guard input ~= inputPattern else {
            throw IOError.invalidInputFormat
        }
        let splitedInput = input.components(separatedBy: "/").map {$0.trimmingCharacters(in: .whitespaces)}
        return (name: splitedInput[0], age: splitedInput[1], phone: splitedInput[2])
    }
}
