//
//  Error.swift
//  ios-contact-manager
//
//  Created by 송선진 on 2022/12/22.
//

import Foundation

enum IOError: Error {
    case emptyInput
    
}

extension IOError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .emptyInput:
            return "아무것도 입력되지 않았습니다."
        }
    }
}
