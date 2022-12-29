//
//  Phonebook.swift
//  ios-contact-manager
//
//  Created by sei on 2022/12/28.
//

import Foundation

final class Phonebook {
    private var contacts: [String:[UserInfo]]
    
    var description: String? {
        guard !contacts.isEmpty else {
            return nil
        }
        let sortedContacts = contacts.sorted { $0.key < $1.key }
        let result = sortedContacts.reduce("") { partialResult, contact in
            partialResult + description(of: contact.value)
        }
        return result
    }
    
    init(contacts: [String : [UserInfo]]) {
        self.contacts = contacts
    }
    
    func add(contact: UserInfo) {
        contacts[contact.name, default: []].append(contact)
    }
    
    func getContact(of name: String) -> String? {
        guard let foundUserInfos = contacts[name] else {
            return nil
        }
        return description(of: foundUserInfos)
    }
    
    private func description(of userInfos: [UserInfo]) -> String {
        userInfos.reduce("") { partialResult, currentUserInfo in
            return partialResult + "- \(currentUserInfo)\n"
        }
    }
}
