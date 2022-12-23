//
//  UserInfo.swift
//  ios-contact-manager
//
//  Created by sei_dev on 12/22/22.
//

import Foundation

enum UserInfoParams {
    case name, phone
    
    var regex: String {
        switch self {
        case .name:
            return "^[A-Za-z ]+$"
        case .phone:
            return "^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$"
        }
    }
    
    var error: IOError {
        switch self {
        case .name:
            return IOError.nameError
        case .phone:
            return IOError.phoneError
        }
    }
}

struct UserInfo {
    let name: String
    let age: Int
    let phone: String
    
    init(name: String, age: String, phone: String) throws {
        guard let age = Int(age),
              (1...999).contains(age) else {
            throw IOError.ageError
        }
        self.age = age
        print(self.age)
        
        do {
            let regexName = try name.getInfoAfter(type: .name)
            self.name = regexName.components(separatedBy: " ").joined()
            self.phone = try phone.getInfoAfter(type: .phone)
            
            print(self.name, self.phone)
        } catch {
            throw error
        }
    }
}

