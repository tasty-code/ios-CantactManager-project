//
//  ContactManageSystem.swift
//  ios-cantact-manager
//
//  Created by J.E on 2022/12/21.
//

import Foundation

struct ContactManageSystem {
    let inputManager = InputManager()
    
    func addProfile() {
        let (name, age, tel) = inputManager.inputInfo()
        let jojo = Profile(name: name, age: age, tel: tel)
        print(jojo)
    }
}
