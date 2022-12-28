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
    var repetition = true
    
    enum Menu: String {
        case addProfile = "1"
        case listUpProfile = "2"
        case searchProfile = "3"
        case stop = "x"
    }
    
    static func start() {
        var contactManageSystem = ContactManageSystem()
        
        while contactManageSystem.repetition {
            do {
                let menuInput = try contactManageSystem.receiveMenu()
                contactManageSystem.pipeInMenu(input: menuInput)
                print()
            } catch {
                OutputManager.printGuideMessage(.invalidMenuMessage)
            }
        }
    }
    
    func receiveMenu() throws -> String {
        OutputManager.printGuideMessage(.inputMenuMessage)
        let menuInput = try inputManager.menuInput()
        
        return menuInput
    }
    
    mutating func pipeInMenu(input: String) {
            guard let menu = Menu(rawValue: input) else {
                OutputManager.printGuideMessage(.invalidMenuMessage)
                return
            }
            switch menu {
            case .addProfile:
                addProfile()
            case .listUpProfile:
                listUpProfile()
            case .searchProfile:
                searchProfile()
            case .stop:
                stop()
            }
        }
    
    mutating func addProfile() {
        do {
            OutputManager.printGuideMessage(.inputInfoMessage)
            let inputArray = try inputManager.parseUserInput()
            let (name, age ,tel) = (inputArray[0], inputArray[1], inputArray[2])
            try inputManager.checkUserInput(name, age, tel)
            let profile = Profile(name: name, age: age, tel: tel)
            contactList.append(profile)
            OutputManager.printProfileMessage(profile)
        } catch InputError.invalidInput {
            OutputManager.printGuideMessage(.invalidInputMessage)
        } catch InputError.invalidAge {
            OutputManager.printGuideMessage(.invalidAgeMessage)
        } catch InputError.invalidTel {
            OutputManager.printGuideMessage(.invalidTelMessage)
        } catch {
            OutputManager.printGuideMessage(.invalidInputMessage)
        }
    }
    
    func listUpProfile() {
        
    }
    
    func searchProfile() {
        
    }
    
    mutating func stop() {
        OutputManager.printGuideMessage(.stopSystemMessage)
        repetition = false
    }
}
