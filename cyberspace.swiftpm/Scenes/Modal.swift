import SwiftUI

struct Modal<Content: View >: View {
    @Binding var showModal: Bool
    let showClose: Bool
    
    let title: String
    let content: Content
    
    var body: some View {
        ZStack {
            VStack(spacing: 12) {
                Header(showButton: showClose, title: title)
                
                Spacer()
                
                content
                    .preferredColorScheme(.dark)
            
                .multilineTextAlignment(.leading)
            }
            .padding(32)
        }
        .background(Color(.modalBackground))
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
        .opacity(showModal ? 1 : 0)
        .animation(.easeIn, value: showModal)
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                    .stroke(.white, lineWidth: 2)
        )
        .frame(maxWidth: 886, maxHeight: 632)
    }
}

extension Modal {
    struct Header: View {
        let showButton: Bool
        let title: String
        
        var body: some View {
            HStack {
                Text(title)
                    .font(.system(size: 28, weight: .bold, design: .monospaced))
                    .foregroundStyle(Color(.redText))
                
                Spacer()
                
                if showButton {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 16))
                            .frame(width: 32, height: 32)
                            .background(.quaternary)
                            .clipShape(Circle())
                    })
                }
            }
        }
    }
}
