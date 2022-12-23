//
//  UserInfo.swift
//  ios-contact-manager
//
//  Created by sei_dev on 12/22/22.
//

import Foundation

enum UserInfoParams {
    case name, age, phone
    
    var regex: String {
        switch self {
        case .name:
            return "^[A-Za-z ]+$"
        case .age:
            return "age regex"
        case .phone:
            return "^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$"
        }
    }
    
    var error: IOError {
        switch self {
        case .name:
            return IOError.nameError
        case .age:
            return IOError.ageError
        case .phone:
            return IOError.phoneError
        }
    }
}

struct UserInfo {
    let name: String
    let age: String? = nil
    let phone: String
    
    init(name: String, phone: String) throws {
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

