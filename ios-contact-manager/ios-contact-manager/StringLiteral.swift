//
//  StringLiteral.swift
//  ios-contact-manager
//
//  Created by sei_dev on 12/21/22.
//

import Foundation

enum StringLiteral {
    static let start = """
        연락처 정보를 입력해주세요.
        """
    
    static func infoPrint(of item: CustomStringConvertible) -> String {
        return "입력한 정보는 \(item) 입니다."
    }
    
    static let help = """
        입력 형태를 확인해주세요.
        """
}
