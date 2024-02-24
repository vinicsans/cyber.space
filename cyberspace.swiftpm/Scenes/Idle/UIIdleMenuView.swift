import SwiftUI

enum UIState {
    case message
    case homeIdle
    case idle
}

struct UIIdleMenuView: View {
    @ObservedObject var messageManager: MessageManager
    
    @ObservedObject var scoreManager: ScoreManager
    
    @State private var sheetHeight: CGFloat = .zero
    
    private var spaceshipID: String = "322883133"
    
    @State var state: UIState
    
    @ObservedObject var parentViewModel: IdleViewModel
    
    init(parentViewModel: IdleViewModel, scoreManager: ScoreManager, messageManager: MessageManager, state: UIState) {
        self.parentViewModel = parentViewModel
        self.scoreManager = scoreManager
        self.messageManager = messageManager
        self.state = state
    }
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .top) {
                Text("ID: \(spaceshipID)")
                    .foregroundStyle(Color("Text"))
                    .font(.system(size: 28, weight: .bold, design: .monospaced))
                
                Spacer()
                
                Text("Cyberpoints: \(scoreManager.cyberpoints)")
                    .foregroundStyle(Color("Text"))
                    .font(.system(size: 28, weight: .bold, design: .monospaced))
            }
            
            Spacer()
            
            HStack(alignment: .bottom) {
                Text("> ship ready for take-off.")
                    .foregroundStyle(Color("Text"))
                    .font(.system(size: 20, weight: .regular, design: .monospaced))
                
                Spacer()
                
                Button { messageManager.showModal = true } label: {
                    messageManager.hasUnreadMessages ? Image(systemName: "envelope.badge.fill") : Image(systemName: "envelope.fill")
                }
                .foregroundStyle(Color("Text"))
                .font(.largeTitle)
            }
        }
        .padding(64)
        .sheet(isPresented: $messageManager.showModal) {
            MessageView(messageManager: messageManager)
                .preferredColorScheme(.dark)
                .onDisappear {
                    messageManager.allMessagesRead()
                    
                    if !messageManager.hasUnreadMessages {
                        switch state {
                        case .message:
                            parentViewModel.nextEvent(.phishingAttack, withTimer: true)
                        case .homeIdle:
                            parentViewModel.nextEvent(.homeIdle, withTimer: true)
                        case .idle:
                            parentViewModel.nextEvent(.idle, withTimer: true)
                            
                        }
                    }
                }
                .overlay {
                    GeometryReader { geometry in
                        Color.clear.preference(key: InnerHeightPreferenceKey.self, value: geometry.size.height)
                    }
                }
                .onPreferenceChange(InnerHeightPreferenceKey.self) { newHeight in
                    sheetHeight = newHeight
                }
                .presentationDetents([.height(sheetHeight)])
        }
    }
}
