//
//  Extension.swift
//  ios-contact-manager
//
//  Created by 송선진 on 2022/12/23.
//

import Foundation

extension String {
    func getInfoAfter(type: UserInfoParams) throws -> String {
        guard let info = self.range(of: type.regex, options: .regularExpression) else {
            throw type.error
        }
        return self
    }
}
