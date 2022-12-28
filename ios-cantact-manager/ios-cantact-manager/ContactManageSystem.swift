//
//  ContactManageSystem.swift
//  ios-cantact-manager
//
//  Created by J.E on 2022/12/21.
//

import Foundation

struct ContactManageSystem {
    let inputManager = InputManager()
    var profileData = [Profile]()
    var isFinished = false
    
    enum Menu: String {
        case addProfile = "1"
        case listUpProfile = "2"
        case searchProfile = "3"
        case stop = "x"
    }
    
    func deliverMenuInputValue() throws -> String {
        OutputManager.printMessage(.inputMenu)
        let menuInput = try inputManager.menuInput()
        
        return menuInput
    }
    
    mutating func pipeInMenu(_ input: String) {
            guard let input = Menu(rawValue: input) else {
                OutputManager.printMessage(.invalidMenu)
                return
            }
            switch input {
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
            OutputManager.printMessage(.inputInfo)
            let inputArray = try inputManager.parseUserInput()
            let (name, age ,tel) = (inputArray[0], inputArray[1], inputArray[2])
            try inputManager.checkUserInput(name, age, tel)
            let profile = Profile(name: name, age: age, tel: tel)
            profileData.append(profile)
            OutputManager.printProfile(profile)
        } catch InputError.invalidInput {
            OutputManager.printMessage(.invalidInput)
        } catch InputError.invalidAge {
            OutputManager.printMessage(.invalidAge)
        } catch InputError.invalidTel {
            OutputManager.printMessage(.invalidTel)
        } catch {
            OutputManager.printMessage(.invalidInput)
        }
    }
    
    func listUpProfile() {
        
    }
    
    func searchProfile() {
        
    }
    
    mutating func stop() {
        OutputManager.printMessage(.stopSystem)
        isFinished = true
    }
}
