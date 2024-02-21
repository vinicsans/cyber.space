import SwiftUI

struct UIIdleMenuView: View {
    @ObservedObject var messageManager = MessageManager.shared
    
    @State private var sheetHeight: CGFloat = .zero
    
    private var spaceshipID: String = "322883133"
    private var cyberpointCount: Int = 0
    private var hasUnreadMessages: Bool { messageManager.allMessagesRead() }
        
    @ObservedObject var parentViewModel: IdleViewModel

    init(parentViewModel: IdleViewModel  ) {
        self.parentViewModel = parentViewModel
    }
        
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .top) {
                Text(spaceshipID)
                    .foregroundStyle(Color("Text"))
                    .font(.system(size: 28, weight: .bold, design: .monospaced))
                
                Spacer()
                
                Text("Cyberpoints: \(cyberpointCount)")
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
                    hasUnreadMessages ? Image(systemName: "envelope.badge.fill") : Image(systemName: "envelope.fill")
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
                    parentViewModel.nextEvent(.homeIdle, withTimer: true)
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
