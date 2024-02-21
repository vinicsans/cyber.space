import SwiftUI

enum AlertType {
    case securityInvasion
    case error
}

struct AlertModal: View {
    @Binding var showModal: Bool
    
    @State var showedCamera: Bool = false
    
    var alertType: AlertType
    let showClose: Bool
    
    let onClick: () -> Void
        
    var title: String {
        switch alertType {
        case .securityInvasion:
            "// SECURITY ALERT"
        case .error:
            "// ERROR"
        }
    }
    
    var message: String {
        switch alertType {
        case .securityInvasion:
            invasionMessage
        case .error:
            errorMessage
        }
    }
    
    let invasionMessage = """
    The ship's access system is being compromised. Many access requests are occurring continuously, indicating a brute force attack. The situation is critical, and immediate measures are needed to ensure the ship's safety.

    LOG:
    > WARN: The ship's password is weak and is the default. Change it as soon as possible.
    """
    
    let errorMessage = """
    You have provided sensitive information that should not be shared about the ship's security system. The nanorobots would be able to break in. But that's okay, what do you say we start again?
    """

    var body: some View {
        ZStack {
            VStack(spacing: 24) {
                Header(showButton: showClose, title: title, isAlert: true) {
                    showModal.toggle()
                }
                    .foregroundStyle(.white)
                            
                Text(message)
                    .bold()
                    .font(.system(size: 18, design: .monospaced))
                    .foregroundStyle(.white)
                
                if alertType == .error {
                    Button(action: {}, label: {
                        Text("Start again")
                            .font(.system(size: 18, design: .monospaced))
                            .foregroundStyle(.white)
                            .bold()
                    })
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.25))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                } else {
                    
                    if !showedCamera {
                        NavigationLink(destination:
                                        BotAttackScene()
                            .toolbar(.hidden)
                                       , label: {
                                Text("Show in camera")
                                    .font(.system(size: 18, design: .monospaced))
                                    .foregroundStyle(.white)
                                    .bold()
                            })
                        .padding(16)
                        .frame(maxWidth: .infinity)
                        .background(.white.opacity(0.25))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    } else {
                            Button(action: {
                                onClick()
                            }, label: {
                                Text("Reset password")
                                    .font(.system(size: 18, design: .monospaced))
                                    .foregroundStyle(.white)
                                    .bold()
                            })
                        .padding(16)
                        .frame(maxWidth: .infinity)
                        .background(.white.opacity(0.25))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                }
            }
            .padding(32)
        }
        .background(Color(red: 0.2, green: 0.02, blue: 0.02).opacity(0.85))
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
        .opacity(showModal ? 1 : 0)
        .animation(.easeIn, value: showModal)
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                    .stroke(.white, lineWidth: 2)
        )
        .frame(maxWidth: 700, maxHeight: .infinity)
        .onDisappear {
            showedCamera = true
        }
    }
    
}
