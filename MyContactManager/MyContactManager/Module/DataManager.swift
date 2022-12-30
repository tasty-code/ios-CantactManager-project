//
//  DataManager.swift
//  MyContactManager
//
//  Created by DONGWOOK SEO on 2022/12/30.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    var contacts: Set<Person> = Set<Person>()
    
    func setContact(_ data: Person) {
        contacts.insert(data)
    }
    
    func getContactsData() -> Set<Person> {
        return contacts
    }
    
    func getContactsList() -> [String] {
        
        let contacts = contacts.map{ "- \($0.name) / \($0.age) / \($0.phoneNum)"}
        
        return contacts
    }
    private init() {}
}
