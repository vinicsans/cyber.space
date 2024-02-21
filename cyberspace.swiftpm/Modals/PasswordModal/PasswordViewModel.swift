import Foundation
import SwiftUI

enum PasswordScore {
    case weak
    case medium
    case strong
}

struct PasswordSecurity {
    var state: PasswordScore
    var content: String {
        switch state {
        case .weak:
            "Weak"
        case .medium:
            "Medium"
        case .strong:
            "Strong"
        }
    }
}

class PasswordViewModel: ObservableObject {
    
    // MARK: Password
    
    @Published var password: String = ""
    @Published var passwordSecurity: PasswordSecurity = PasswordSecurity(state: .weak)
    
    // MARK: Requirements
    
    @Published var requirements = Requirements(
        hasLetters: Requirement(content: "Using letters", isValid: false),
        hasLowerAndUppercase: Requirement(content: "Use of capitalization", isValid: false),
        hasNumbers: Requirement(content: "Using numbers", isValid: false),
        hasSpecialCharacters: Requirement(content: "Using special characters", isValid: false),
        isMinimumLengthMet: Requirement(content: "+12 characters", isValid: false),
        isNotCommonPassword: Requirement(content: "Not using common words", isValid: false)
    )
    
    // MARK: Drag and Drop
    
    @Published var undroppedFragments: [PasswordFragment] = [
        PasswordFragment(content: "12345"),
        PasswordFragment(content: "12345VQABD"),
        PasswordFragment(content: "admin"),
        PasswordFragment(content: "qwerty"),
        PasswordFragment(content: "themasterofpuppet"),
        PasswordFragment(content: "mainlol123"),
        PasswordFragment(content: "35745873639qVc^>"),
        PasswordFragment(content: "849375"),
        PasswordFragment(content: "J[1W9i7"),
        PasswordFragment(content: "theM8230384")
    ]
    
    @Published var droppedFragments: [PasswordFragment] = []
    
    func addDroppedFragments(_ fragments: [PasswordFragment]) {
        for fragment in fragments {
            undroppedFragments.removeAll(where: { $0 == fragment })
            password += fragments.map(\.content).joined()
        }
        droppedFragments.append(contentsOf: fragments)
        updatePasswordRequirements()
    }
    
    func removeDroppedFragments(_ fragments: [PasswordFragment]) {
        for fragment in fragments {
            droppedFragments.removeAll(where: { $0 == fragment })
            password += fragments.map(\.content).joined()
        }
        undroppedFragments.append(contentsOf: fragments)
        updatePasswordRequirements()
    }
    
    // MARK: Validation
    
    var passwordColor: Color {
        switch passwordSecurity.state {
        case .weak: return Constants.Colors.redText
        case .medium: return Constants.Colors.orange
        case .strong: return Constants.Colors.green
        }
    }
    
    private func calculatePasswordScore(_ password: String) -> PasswordScore {
        let length = password.count
        requirements.isMinimumLengthMet.isValid = length >= 12
        requirements.hasLetters.isValid = password.contains(try! Regex("[a-zA-Z]")) ? true : false
        
        if isLowercase(password) && isUppercase(password) {
            requirements.hasLowerAndUppercase.isValid = true
        }
        
        requirements.hasNumbers.isValid = hasNumbers(password)
        requirements.hasSpecialCharacters.isValid = hasSpecialCharacters(password)
        requirements.isNotCommonPassword.isValid = !isCommonPassword(password)
        
        if !requirements.isMinimumLengthMet.isValid {
            return .weak
        } else if requirements.hasLowerAndUppercase.isValid {
            return .medium
        } else if !requirements.hasNumbers.isValid {
            return .medium
        } else if !requirements.isNotCommonPassword.isValid {
            return .medium
        } else if requirements.hasSpecialCharacters.isValid {
            return .strong
        } else {
            return .strong
        }
    }
    
    private func updatePasswordRequirements() {
        passwordSecurity.state = checkPasswordStrength(password)
    }
}

// MARK: Business rule of validation

extension PasswordViewModel {
    private func isLowercase(_ password: String) -> Bool {
        password.lowercased() != password
    }
    
    private func isUppercase(_ password: String) -> Bool {
        password.uppercased() != password
    }
    
    private func hasNumbers(_ password: String) -> Bool {
        password.range(of: "[0-9]", options: .regularExpression) != nil
    }
    
    private func hasSpecialCharacters(_ password: String) -> Bool {
        password.range(of: "[,.!?;:@ ^]", options: .regularExpression) != nil
    }
    
    private func isCommonPassword(_ password: String) -> Bool {
        let commonWords = ["senha", "password", "123456", "abc123", "qwerty", "123456789", "password1", "iloveyou", "111111"]
        return commonWords.contains(where: { password.lowercased().contains($0) })
    }
    
    func checkPasswordStrength(_ password: String) -> PasswordScore {
        let score = calculatePasswordScore(password)
        passwordSecurity.state = score
        return score
    }
}
