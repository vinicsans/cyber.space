import SwiftUI
import Foundation

enum MainState {
    case homeIdle
    case idle
    case botAttack
    case passwordAttack
    case phishingAttack
    case firewallAttack
}

class IdleViewModel: ObservableObject {
    @Published var state: MainState = .homeIdle
    @Published var finished: Bool = false
    
    @Published var showModalInAction = true
    
    private var events: [MainState] = [
        MainState.homeIdle,
        MainState.botAttack,
        MainState.passwordAttack,
        MainState.idle,
        MainState.phishingAttack,
        MainState.firewallAttack
    ]
    
    func nextEvent(_ actualScene: MainState, withTimer: Bool) {
        let actualStateInArray = events.firstIndex(of: actualScene)
                
        if withTimer {
            let timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { [self] timer in
                state = self.events[actualStateInArray! + 1]
                showModalInAction = true
            }
        } else {
            state = self.events[actualStateInArray! + 1]
            showModalInAction = true
        }
    }
        
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
