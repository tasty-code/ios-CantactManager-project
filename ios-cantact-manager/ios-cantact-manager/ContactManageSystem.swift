//
//  ContactManageSystem.swift
//  ios-cantact-manager
//
//  Created by J.E on 2022/12/21.
//

import Foundation

struct ContactManageSystem {
    let inputManager = InputManager()
    var contactList = [Profile]()
    var loopStarter = true
    
    enum Menu: String {
        case addProfile = "1"
        case watchList = "2"
        case searchList = "3"
        case stop = "x"
    }
    
    func receiveMenu() throws -> String {
        let menuInput = try inputManager.menuInput()
        return menuInput
    }
    
    mutating func startProgram(input: String) {
        switch Menu(rawValue: input) {
        case .addProfile:
            addProfile()
            print(contactList)
        case .watchList:
            watchList()
        case .searchList:
            searchList()
        case .stop:
            stop()
        default:
            inputManager.printWrongInput()
        }
        print()
    }
    
    static func start() {
        var contactManageSystem = ContactManageSystem()
        
        while contactManageSystem.loopStarter {
            do {
                let input = try contactManageSystem.receiveMenu()
                contactManageSystem.startProgram(input: input)
            } catch {
                contactManageSystem.inputManager.printWrongInput()
            }
        }
    }
    
    mutating func addProfile() {
        do {
            let inputArray = try inputManager.parseUserInput()
            let (name, age ,tel) = (inputArray[0], inputArray[1], inputArray[2])
            try inputManager.checkUserInput(name, age, tel)
            let profile = Profile(name: name, age: age, tel: tel)
            contactList.append(profile)
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
    
    func watchList() {
        
    }
    
    func searchList() {
        
    }
    
    mutating func stop() {
        print("\n[프로그램 종료]", terminator: "")
        loopStarter = false
    }
}
