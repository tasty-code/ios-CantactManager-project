//
//  UserInputModel.swift
//  MyContactManager
//
//  Created by devxsby on 2022/12/28.
//

import Foundation

struct UserInputModel {
    let name: String
    let age: String
    let phoneNum: String
    
    func convertToPerson() -> Person? {
        guard let age = Int(age) else { return nil }
        return Person(name: name, age: age, phoneNum: phoneNum)
    }
}
