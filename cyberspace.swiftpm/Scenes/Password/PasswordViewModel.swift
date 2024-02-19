//
//  File.swift
//  
//
//  Created by user on 18/02/24.
//

import Foundation
import SwiftUI

enum Strength {
    case weak
    case medium
    case strong
}

struct PasswordStrength {
    let strength: Strength

    var title: String {
        switch strength {
        case .weak:
            return "Weak"
        case .medium:
            return "Medium"
        case .strong:
            return "Strong"
        }
    }
}

class PasswordViewModel: ObservableObject {
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
    
    @Published var passwordStrength: PasswordStrength = PasswordStrength(strength: .weak)
    
    var passwordColor: Color {
        switch passwordStrength.strength {
        case .weak:
            return Color(.redText)
        case .medium:
            return Color(.yellow)
        case .strong:
            return Color(.green)
        }
    }
    
    func addDroppedFragments(_ fragments: [PasswordFragment]) {
        for fragment in fragments {
            undroppedFragments.removeAll { $0 == fragment}
        }
        droppedFragments.append(contentsOf: fragments)
    }
}
