//
//  Extension.swift
//  ios-contact-manager
//
//  Created by 송선진 on 2022/12/23.
//

import Foundation

extension String {
    func matches(InfoType: UserInfoParameters) throws -> String {
        guard self ~= InfoType.regex else {
            throw InfoType.error
        }
        return self
    }
    
    static func ~= (_ lhs: String, _ rhs: String) -> Bool {
        return lhs.range(of: rhs, options: .regularExpression) != nil
    }
}
