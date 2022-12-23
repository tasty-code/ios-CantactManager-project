//
//  main.swift
//  ios-contact-manager
//
//  Created by 송선진 on 2022/12/21.
//

import Foundation

//ContactManager.shared.run()

let goodName = "    Su  n ny s"
let badName = "sssss  ss00"
let goodPhone = "232-2324-2423"
let badPhone = "1-22312-122"
let badPhone2 = "1-22312-12 "
let badPhone3 = "1-22 1-12 ㄱ"

let t1 = try? UserInfo(name: goodName, phone: goodPhone)
do {
    let _ = try UserInfo(name: goodName, phone: badPhone)
} catch {
    print(error.localizedDescription)
}
do {
    let _ = try UserInfo(name: goodName, phone: badPhone2)
} catch {
    print(error.localizedDescription)
}
do {
    let _ = try UserInfo(name: goodName, phone: badPhone3)
} catch {
    print(error.localizedDescription)
}
