//
//  UserInfo.swift
//  ios-contact-manager
//
//  Created by sei_dev on 12/22/22.
//

import Foundation

struct UserInfo {
    let name: String
    let age: Int?
    let phone: String?
    
    init(name: String) throws {
        guard Self.checkValidity(of: name) else {
            throw IOError.nameError
        }
    }
    
    static func checkValidity(of item: String) {
        
    }
}


