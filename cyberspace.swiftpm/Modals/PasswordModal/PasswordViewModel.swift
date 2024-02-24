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
            
            let rangeToRemove = password.range(of: fragment.content)
            if let range = rangeToRemove {
              password.removeSubrange(range)
            }
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
        
        if password.isEmpty {
            requirements.hasLetters.isValid = false
            requirements.hasLowerAndUppercase.isValid = false
            requirements.hasNumbers.isValid = false
            requirements.hasSpecialCharacters.isValid = false
            requirements.isMinimumLengthMet.isValid = false
            requirements.isNotCommonPassword.isValid = false
        }
        
      let length = password.count
      requirements.isMinimumLengthMet.isValid = length >= 12

      // Verificação aprimorada de letras
      let hasLetters = password.range(of: "[a-zA-Z]", options: .regularExpression) != nil
      requirements.hasLetters.isValid = hasLetters

      if hasLetters {
        // Verificação de letras maiúsculas e minúsculas
        let hasLowercase = password.lowercased() != password
        let hasUppercase = password.uppercased() != password
        requirements.hasLowerAndUppercase.isValid = hasLowercase && hasUppercase
      }

      // Verificação aprimorada de números
      let hasNumbers = password.range(of: "[0-9]", options: .regularExpression) != nil
      requirements.hasNumbers.isValid = hasNumbers

      // Verificação aprimorada de caracteres especiais
      let hasSpecialCharacters = password.range(of: "[,.!?;:@^]", options: .regularExpression) != nil
      requirements.hasSpecialCharacters.isValid = hasSpecialCharacters

      // Verificação aprimorada de senhas comuns
      requirements.isNotCommonPassword.isValid = !isCommonPassword(password)

      // Cálculo da pontuação ponderada
      var score = 0
      if requirements.hasLetters.isValid { score += 2 }
      if requirements.hasLowerAndUppercase.isValid { score += 2 }
      if requirements.hasNumbers.isValid { score += 2 }
      if requirements.hasSpecialCharacters.isValid { score += 2 }
      if requirements.isMinimumLengthMet.isValid { score += 1 }
      if requirements.isNotCommonPassword.isValid { score += 1 }

      // Definição da pontuação final
      switch score {
      case 0...3:
        return .weak
      case 4...6:
        return .medium
      case 7...8:
        return .strong
      default:
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
        password.range(of: "[,.!?;:@^]", options: .regularExpression) != nil
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
