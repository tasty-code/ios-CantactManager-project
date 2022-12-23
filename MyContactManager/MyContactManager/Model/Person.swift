//
//  Person.swift
//  MyContactManager
//
//  Created by DONGWOOK SEO on 2022/12/22.
//

import Foundation

struct Person {
    let name: String
    let age: Int
    let phoneNum: String
    
    init(name: String, age: Int, phoneNum: String) {
        self.name = name
        self.age = age
        self.phoneNum = phoneNum
    }
}
