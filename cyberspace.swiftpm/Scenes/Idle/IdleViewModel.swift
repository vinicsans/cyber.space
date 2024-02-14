import SwiftUI

enum MainState {
    case idle
    case botAttack
    case passwordAttack
    case phishingAttack
    case firewallAttack
}

class IdleViewModel: ObservableObject {
    @Published var state: MainState = .idle
    
    func botAttack() {
        state = .botAttack
    }
    
    func passwordAttack() {
        state = .passwordAttack
    }
    
    func phishingAttack() {
        state = .phishingAttack
    }
    
    func firewallAttack() {
        state = .firewallAttack
    }
    
    func idle() {
        state = .idle
    }
}
