//
//  ContactsManagable.swift
//  ios-contact-manager
//
//  Created by Swain Yun on 10/5/23.
//

import Foundation

protocol ContactsManagable {
    func updateContact(_ contact: Contact)
    
    func createContact(_ contact: Contact)
}
