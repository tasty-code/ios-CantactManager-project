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
            let inputArray = try inputManager.parseUserInput()
            let (name, age, tel) = try inputManager.checkUserInput(name: inputArray[0], age: inputArray[1], tel: inputArray[2])
            let profile = Profile(name: name, age: age, tel: tel)
            contactList.updateValue(profile, forKey: name)
            print("입력한 정보는 \(age)세 \(name)(\(tel))입니다.")
        } catch InputError.invalidInput {
            print("입력한 정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
        } catch InputError.invalidAge {
            print("입력한 나이정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
        } catch InputError.invalidTel {
            print("입력한 연락처정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
        } catch {
            print("입력한 정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
        }
    }
}
