//
//  File.swift
//  
//
//  Created by user on 17/02/24.
//

import Foundation
import SwiftUI

struct Requirement {
    let content: String
    var isValid: Bool
}

struct Requirements {
    var hasLetters: Requirement
    var hasLowerAndUppercase: Requirement
    var hasNumbers: Requirement {
        didSet {
            
        }
    }
    var hasSpecialCharacters: Requirement
    var isMinimumLengthMet: Requirement
    var isNotCommonPassword: Requirement
    
    var isValid: Bool {
        if hasLetters.isValid && hasLowerAndUppercase.isValid && hasNumbers.isValid && hasSpecialCharacters.isValid && isMinimumLengthMet.isValid && isNotCommonPassword.isValid {
            return true
        }
        
        return false
    }
        
    var allRequirements: [Requirement] {
        [hasLetters, hasLowerAndUppercase, hasNumbers, hasSpecialCharacters, isMinimumLengthMet, isNotCommonPassword]
    }
}
