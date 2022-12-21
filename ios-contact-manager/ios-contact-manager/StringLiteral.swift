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
    
    static func infoPrint(name:String, age:Int, phone:String) -> String {
        return "입력한 정보는 \(age)세 \(name)(\(phone)) 입니다."
    }
    
    static let help = """
        help를 입력하면 올바른 입력 형태를 확인할 수 있습니다.
        """
    
    static let rightInput = """
        올바른 사용자 입력 형태 : [이름] / [나이] / [연락처] 또는 [이름]/[나이]/[연락처]
        - 이름은 영어만 입력할 수 있습니다.
        - 나이는 숫자로만 입력해야하며, 세 자리수 이하여야 합니다.
        - 연락처는 {2,3자리}-{3,4자리}-{4자리}로 입력해주세요.
        """
}
