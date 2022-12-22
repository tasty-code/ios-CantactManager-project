//
//  ContactManageSystem.swift
//  ios-cantact-manager
//
//  Created by J.E on 2022/12/21.
//

import Foundation

struct ContactManageSystem {
    let inputManager = InputManager()
    var contactList = [String: Profile]()
    
    mutating func addProfile() {
        let inputArray = inputManager.inputInfo()
        let (name, age, tel) = (inputArray[0], inputArray[1], inputArray[2])
        contactList.updateValue(Profile(name: name, age: age, tel: tel), forKey: name)
        print(contactList)  // FIXIT: - 테스토용(이후 제거)
    }
}
