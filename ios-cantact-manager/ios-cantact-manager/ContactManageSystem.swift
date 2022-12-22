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
//        var name = ""
//        var age = ""
//        var tel = ""
//        do {
//            let inputArray = try inputManager.inputInfo()
//            name = inputArray[0]
//            age = inputArray[1]
//            tel = inputArray[2]
//        } catch {
//            print("없음오류발생")
//        }
//        do {
//            let checkedName = try inputManager.checkName(name)
//        } catch {
//            print("이름오류발생")
//        }
//        do {
//            let checkedAge = try inputManager.checkAge(age)
//        } catch {
//            print("나이오류발생")
//        }
//        do {
//            let checkedTel = try inputManager.checkTel(tel)
//        } catch {
//            print("연락처오류발생")
//        }
//
//        contactList.updateValue(Profile(name: name, age: age, tel: tel), forKey: name)
//        print("입력한 정보는 \(age)세 \(name)(\(tel))입니다.")  // FIXIT: - 테스토용(이후 제거)
        
        do {
            let inputArray = try inputManager.inputInfo()
            let name = try inputManager.checkName(inputArray[0])
            let age = try inputManager.checkAge(inputArray[1])
            let tel = try inputManager.checkTel(inputArray[2])
            contactList.updateValue(Profile(name: name, age: age, tel: tel), forKey: name)
            print("입력한 정보는 \(age)세 \(name)(\(tel))입니다.")  // FIXIT: - 테스토용(이후 제거)
        } catch ValidInputError.notValidInput {
            print("입력한 정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
        } catch ValidInputError.notValidName {
            print("입력한 이름정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
        } catch ValidInputError.notValidAge {
            print("입력한 나이정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
        } catch ValidInputError.notValidTel {
            print("입력한 연락처정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
        } catch {
            print("입력한 정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
        }
    }
}
