//
//  File.swift
//  
//
//  Created by user on 17/02/24.
//

import Foundation

enum RequirementType {
    case more12Char
    case useLetters
    case useNumbers
    case useSpecialChar
    case notUseCommonWords
    case noSequences
}

struct Requirement {
    let type: RequirementType
    let content: String
    
    init(type: RequirementType) {
        self.type = type
        
        switch type {
        case .more12Char:
            self.content = "+12 characters"
        case .noSequences:
            self.content = "No sequences"
        case .notUseCommonWords:
            self.content = "Not using common words"
        case .useLetters:
            self.content = "Using letters"
        case .useNumbers:
            self.content = "Using numbers"
        case .useSpecialChar:
            self.content = "User special characters"
        default:
            fatalError("Not defined content")
        }
    }
}

struct PasswordPart {
    let id = UUID()
    let content: String
}
