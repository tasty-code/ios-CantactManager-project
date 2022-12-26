//
//  UserInfo.swift
//  ios-contact-manager
//
//  Created by sei_dev on 12/22/22.
//

import Foundation

enum UserInfoParameters: String {
    case name = "이름"
    case age = "나이"
    case phone = "연락처"
    
    var regex: String {
        switch self {
        case .name:
            return "^[A-Za-z ]+$"
        case .phone:
            return "^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$"
        default:
            return ""
        }
    }
    
    var error: IOError {
        return IOError.invalidProperty(parameter: self)
    }
}

struct UserInfo {
    let name: String
    let age: Int
    let phone: String
    
    //    init(input: InfoInput) throws {
    //        guard let age = Int(input.age),
    //              (1...999).contains(age) else {
    //            throw IOError.ageError
    //        }
    //        self.age = age
    //
    //        do {
    //            let regexName = try input.name.getInfoAfter(type: .name)
    //            self.name = regexName.components(separatedBy: " ").joined()
    //            self.phone = try input.phone.getInfoAfter(type: .phone)
    //        } catch {
    //            throw error
    //        }
    //    }
    
    init(name:String, age:String, phone: String) throws {
        guard let age = Int(age),
              (1...999).contains(age) else {
            throw IOError.invalidProperty(parameter: .age)
        }
        self.age = age
        
        do {
            let regexName = try name.getInfoAfter(type: .name)
            self.name = regexName.components(separatedBy: " ").joined()
            self.phone = try phone.getInfoAfter(type: .phone)
        } catch {
            throw error
        }
    }
    
    init(input: InfoInput) throws {
        try self.init(name: input.name, age: input.age, phone: input.phone)
    }
}

extension UserInfo: CustomStringConvertible {
    var description: String {
        return "\(self.age)세 \(self.name)(\(self.phone))"
    }
}
