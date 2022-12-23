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
            return "phone regex"
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
    let phone: String? = nil
    
    init(name: String) throws {
        do {
            self.name = try name.getInfoAfter(type: .name)
            print(self.name)
        } catch {
            throw error
        }
         
//        guard Self.checkValidity(of: name) else {
//            throw IOError.nameError
//        }
    }
    
    static func checkValidity(of item: String, type: UserInfoParams) -> Bool {
        return item ~= type.regex
    }
}

