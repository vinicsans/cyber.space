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
    
    @State var errorMode: Bool
    
    @State var state: UIState
    
    @ObservedObject var parentViewModel: IdleViewModel
    
    init(parentViewModel: IdleViewModel, scoreManager: ScoreManager, messageManager: MessageManager, state: UIState, isErrorMode: Bool) {
        self.parentViewModel = parentViewModel
        self.scoreManager = scoreManager
        self.messageManager = messageManager
        self.state = state
        self.errorMode = isErrorMode
    }
    
    var body: some View {
        
        if errorMode {
            
            ZStack {
                
                VStack(alignment: .center) {
                    HStack(alignment: .top) {
                        Text("!@#!%!@*(#*!#*)&%)!(@#*&")
                            .foregroundStyle(Color("Text"))
                            .font(.system(size: 28, weight: .bold, design: .monospaced))
                        
                        Spacer()
                        
                        Text("&(*!&@(#*¨%(@&*")
                            .foregroundStyle(Color("Text"))
                            .font(.system(size: 28, weight: .bold, design: .monospaced))
                    }
                    
                    Spacer()
                    
                    HStack(alignment: .bottom) {
                        Text("@)#$(*)(!&%!_#*")
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
                
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundStyle(Color(red: 0.73, green: 0.1, blue: 0.21).opacity(0.15))
                
            }
            
        } else {
            
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
                MessageView(messageManager: messageManager, onCloseAction: {})
                    .preferredColorScheme(.dark)
                    .onDisappear {
                        messageManager.allMessagesRead()
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
                    .onDisappear {  
                        if !messageManager.hasUnreadMessages {
                            print(messageManager.hasUnreadMessages)

                            switch state {
                            case .message:
                                if messageManager.fakeMessageAction && messageManager.trueMessageAction {
                                    parentViewModel.nextEvent(.phishingAttack, withTimer: true)
                                }
                            case .homeIdle:
                                parentViewModel.nextEvent(.homeIdle, withTimer: true)
                            case .idle:
                                parentViewModel.nextEvent(.idle, withTimer: true)
                                
                            }
                        }
                    }
            }
        }
    }
}
