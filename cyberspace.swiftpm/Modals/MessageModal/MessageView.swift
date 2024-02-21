import SwiftUI

struct MessageView: View {
    
    @ObservedObject var messageManager: MessageManager
            
    @State private var showModal = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List(messageManager.messages) { item in
                NavigationLink(destination: MessageDetailsView(message: item, messageManager: messageManager), label: {
                    MessageLineRow(message: item)
                        .frame(height: 48)
                })
            }
            .navigationTitle("E-mails")
            .toolbar {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
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


#Preview {
    MessageView(messageManager: MessageManager())
}
