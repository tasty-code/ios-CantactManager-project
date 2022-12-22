//
//  IOManager.swift
//  ios-contact-manager
//
//  Created by 송선진 on 2022/12/22.
//

import Foundation

enum IOManager {
    static func getInput() throws -> String {
        guard let input = readLine(),
              input != "" else {
            throw IOError.emptyInput
        }
        
        return input
    }
}
