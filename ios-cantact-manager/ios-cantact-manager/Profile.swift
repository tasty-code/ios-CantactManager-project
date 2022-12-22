//
//  Profile.swift
//  ios-cantact-manager
//
//  Created by J.E on 2022/12/21.
//

import Foundation

struct Profile {
    var name: String
    var age: String
    var tel: String
        
    init(name: String, age: String, tel: String) {
        self.name = name
        self.age = age
        self.tel = tel
    }
    
    mutating func updateProfile(name: String, age: String, tel: String) {
        self.name = name
        self.age = age
        self.tel = tel
    }
}
