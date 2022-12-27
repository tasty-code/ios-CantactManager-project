//
//  ContactManageSystem.swift
//  ios-cantact-manager
//
//  Created by J.E on 2022/12/21.
//

import Foundation

struct ContactManageSystem {
    let inputManager = InputManager()
    let outputManager = OutputManager()
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
                contactManageSystem.outputManager.printInvalidMenu()
            }
        }
    }
    
    func receiveMenu() throws -> String {
        outputManager.printInputMenu()
        let menuInput = try inputManager.menuInput()
        return menuInput
    }
    
    mutating func pipeInMenu(input: String) {
        switch Menu(rawValue: input) {
        case .addProfile:
            addProfile()
        case .listUpProfile:
            listUpProfile()
        case .searchProfile:
            searchProfile()
        case .stop:
            stop()
        default:
            outputManager.printInvalidMenu()
        }
    }
    
    mutating func addProfile() {
        do {
            outputManager.printInputInfo()
            let inputArray = try inputManager.parseUserInput()
            let (name, age ,tel) = (inputArray[0], inputArray[1], inputArray[2])
            try inputManager.checkUserInput(name, age, tel)
            let profile = Profile(name: name, age: age, tel: tel)
            contactList.append(profile)
            outputManager.printUserInput(profile)
        } catch InputError.invalidInput {
            outputManager.printInvalidInput()
        } catch InputError.invalidAge {
            outputManager.printInvalidAge()
        } catch InputError.invalidTel {
            outputManager.printInvalidTel()
        } catch {
            outputManager.printInvalidInput()
        }
    }
    
    func listUpProfile() {
        
    }
    
    func searchProfile() {
        
    }
    
    mutating func stop() {
        outputManager.printStopSystem()
        repetition = false
    }
}
