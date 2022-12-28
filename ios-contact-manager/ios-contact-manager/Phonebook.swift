//
//  Phonebook.swift
//  ios-contact-manager
//
//  Created by sei on 2022/12/28.
//

import Foundation

class Phonebook {
    var contacts: [String:[UserInfo]]
    init(contacts: [String : [UserInfo]]) {
        self.contacts = contacts
    }
    
    func add(contact: UserInfo) {
        contacts[contact.name, default: []].append(contact)
    }
}
