//
//  ProgramManager.swift
//  MyContactManager
//
//  Created by DONGWOOK SEO on 2022/12/26.
//

import Foundation

final class ProgramManager {
    
    let inputEditor = InputEditor()
    let outputEditor = OutputEditor()
    
    private var shouldRun: Bool = true
    
    func runProgram() {
        while shouldRun {
            outputEditor.printMenu()
            do {
                shouldRun = try inputEditor.selectMenu()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func terminateProgram() {
        shouldRun = false
    }
}
