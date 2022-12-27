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
    
    static var loopStarter = true
    
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
        Self.loopStarter = true
        switch Menu(rawValue: input) {
        case .addProfile:
            addProfile()
        case .watchList:
            watchList()
        case .searchList:
            searchList()
        case .stop:
            stop()
        default:
            break
        }
        print()
    }
    
    static func start() {
        while Self.loopStarter {
            var contactManageSystem = ContactManageSystem()
            
            do {
                let input = try contactManageSystem.receiveMenu()
                contactManageSystem.startProgram(input: input)
            } catch {
                print("선택이 잘못되었습니다 확인 후 다시 입력해주세요.")
            }
        }
    }

    
    mutating func addProfile() {
        do {
            let inputArray = try inputManager.parseUserInput()
            let (name, age ,tel) = (inputArray[0], inputArray[1], inputArray[2])
            try inputManager.checkUserInput(name, age, tel)
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
    
    func watchList() {
        
    }
    
    func searchList() {
        
    }
    
    mutating func stop() {
        print("\n[프로그램 종료]")
        Self.loopStarter = false
    }
}
