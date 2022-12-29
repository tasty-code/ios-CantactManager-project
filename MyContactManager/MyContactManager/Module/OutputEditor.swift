//
//  OutputEditor.swift
//  MyContactManager
//
//  Created by devxsby on 2022/12/28.
//

import Foundation

struct OutputEditor {
    
    func printGreeting() {
        print(Messages.greeting.rawValue, terminator: " ")
    }
    
    func printResult(with person: Person) {
        print("입력한 정보는 \(person.age)세 \(person.name) (\(person.phoneNum))입니다.")
    }
}
