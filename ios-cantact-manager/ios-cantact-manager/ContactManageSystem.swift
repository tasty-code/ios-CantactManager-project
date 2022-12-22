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
        do {
            let inputArray = try inputManager.inputInfo()
            let name = try inputManager.checkName(inputArray[0])
            let age = try inputManager.checkAge(inputArray[1])
            let tel = try inputManager.checkTel(inputArray[2])
            contactList.updateValue(Profile(name: name, age: age, tel: tel), forKey: name)
            print("입력한 정보는 \(age)세 \(name)(\(tel))입니다.")  // FIXIT: - 테스토용(이후 제거)
        } catch ValidInputError.notValidInput {
            print("없음오류발생")
        } catch ValidInputError.notValidName {
            print("이름오류발생")
        } catch ValidInputError.notValidAge {
            print("나이오류발생")
        } catch ValidInputError.notValidTel {
            print("연락처오류발생")
        }
    }
}
