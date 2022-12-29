//
//  Phonebook.swift
//  ios-contact-manager
//
//  Created by sei on 2022/12/28.
//

import Foundation

final class Phonebook {
    private var contacts: [String:[UserInfo]]
    
    var isEmpty: Bool {
        return contacts.isEmpty
    }
    
    var description: String? {
        guard !contacts.isEmpty else {
            return nil
        }
        return contacts.sorted { $0.key < $1.key }.reduce("") { partialResult, contact in
            partialResult + convertDescription(from: contact.value)
        }
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
        return convertDescription(from: foundUserInfos)
    }
    
    private func convertDescription(from userInfos: [UserInfo]) -> String {
        userInfos.reduce("") { partialResult, currentUserInfo in
            return partialResult + "- \(currentUserInfo)\n"
        }
    }
}
