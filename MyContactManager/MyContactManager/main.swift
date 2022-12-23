//
//  main.swift
//  MyContactManager
//
//  Created by devxsby on 2022/12/21.
//

import Foundation

class MyContactManager {
    
    private(set) var runValue: Bool = true
    
    private var personDictionary = [String : Person]()
    
    func runProgram() {
        print(Message.greeting, terminator: " ")
        getUserInput()
    }
    
    private func getUserInput() {
        guard let userInput = readLine() else {   return }
        let inputData = userInput.components(separatedBy: " ").joined()
        let input = inputData.split(separator: "/").map { String($0) }
        
        if input.count == 3 {
            let (name, age, number) = (input[0], input[1], input[2])
            if isVaildPersonType(name, age, number) {
                printResult(name: name, age: age, number: number)
                setContactData(name: name, age: age, number: number)
            }
        } else if input.isEmpty {
            print(Message.noUserInput)
        } else {
            print(Message.defaultError)
        }
    }
    
    private func setContactData(name: String, age: String, number: String) {
        guard let age = Int(age) else { return }
        let person = Person(name: name, age: age, phoneNum: number)
        personDictionary[name] = person
    }
    
    private func printResult(name: String, age: String, number: String) {
        print("입력한 정보는 \(age)세 \(name) (\(number))입니다.")
    }
    
    private func isVaildPersonType(_ name: String, _ age: String, _ number: String) -> Bool {
        if vaildateAgeForm(age) == false {
            print(Message.wrongAge)
            return false
        }
        
        if validateNumberForm(number) == false {
            print(Message.wrongPhoneNumber)
            return false
        }
        return true
    }
    
    private func vaildateAgeForm(_ age: String) -> Bool {
        guard let ageInt = Int(age) else { return false }
        return ageInt < 1000 && ageInt > 0
    }
    
    private func validateNumberForm(_ number: String) -> Bool {
        let numberSplit = number.split(separator: "-").map { String($0) }
        return number.count > 10 && numberSplit.count == 3
    }
    
    private func exitProgram() {
        runValue = false
        print("exit test")
    }
}

func main() {
    let myContactManager = MyContactManager()
    
    while myContactManager.runValue {
        myContactManager.runProgram()
    }
}

main()
