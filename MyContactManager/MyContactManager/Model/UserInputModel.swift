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
        return Person(name: name, age: Int(age) ?? 0, phoneNum: phoneNum)
    }
}
