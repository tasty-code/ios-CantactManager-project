//
//  ContactsManagable.swift
//  ios-contact-manager
//
//  Created by Swain Yun on 10/5/23.
//

import Foundation

protocol ContactsManagable: AnyObject {
    func updateContact(_ contact: Contact, _ indexPath: IndexPath)
    
    func createContact(_ contact: Contact)
}
