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

        let inputArray = inputManager.inputInfo()
        let (name, age, tel) = (inputArray[0], inputArray[1], inputArray[2])
        let jojo = Profile(name: name, age: age, tel: tel)
        print(jojo)
    }
}
