//
//  main.swift
//  ios-contact-manager
//
//  Created by 송선진 on 2022/12/21.
//

import Foundation

//ContactManager.shared.run()

let goodName = "    Su  n ny s"
let goodPhone = "232-2324-2423"
let goodAge = "999"
let badAge = "-10"
let badAge2 = "sssfjeoi"
let badAge3 = "1000"


let t1 = try? UserInfo(name: goodName, age: goodAge, phone: goodPhone)
do {
    let _ = try UserInfo(name: goodName, age: badAge, phone: goodPhone)
} catch {
    print(error.localizedDescription)
}
do {
    let _ = try UserInfo(name: goodName, age: badAge2, phone: goodPhone)
} catch {
    print(error.localizedDescription)
}
do {
    let _ = try UserInfo(name: goodName, age: badAge3, phone: goodPhone)
} catch {
    print(error.localizedDescription)
}
