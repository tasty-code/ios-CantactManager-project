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

let t1 = try? UserInfo(name: goodName)
do {
    let t2 = try UserInfo(name: badName)
} catch {
    print(error.localizedDescription)
}

