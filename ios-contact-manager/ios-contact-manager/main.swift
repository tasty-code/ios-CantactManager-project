//
//  main.swift
//  ios-contact-manager
//
//  Created by 송선진 on 2022/12/21.
//

import Foundation

print("Hello, World!")

do {
    let test = try IOManager.getInput()
    IOManager.sendOutput(type: .infomation, contents: test)
} catch {
    print(error.localizedDescription)
}
