//
//  contactManager.swift
//  ios-cantact-manager
//
//  Created by J.E on 2022/12/28.
//

import Foundation

struct ContactManager {
    var contactManageSystem = ContactManageSystem()
    
    mutating func run() {
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
}
