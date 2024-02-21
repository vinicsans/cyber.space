import SwiftUI

struct Modal<Content: View >: View {
    @Binding var showModal: Bool
    let showClose: Bool
    
    let title: String
    let content: Content
    
    var body: some View {
        ZStack {
            VStack(spacing: 16) {
                Header(showButton: showClose, title: title, isAlert: false) {
                    showModal.toggle()
                }
                
                content
                    .preferredColorScheme(.dark)
            
                .multilineTextAlignment(.leading)
            }
            .padding(32)
        }
        .background(Constants.Colors.Modal.blueBackground)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
        .opacity(showModal ? 1 : 0)
        .animation(.easeIn, value: showModal)
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                    .stroke(.white, lineWidth: 2)
        )
        .frame(maxWidth: 886, maxHeight: .infinity)
    }
}
