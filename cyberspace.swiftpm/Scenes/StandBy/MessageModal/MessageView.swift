import SwiftUI

struct MessageView: View {
    
    var items: [Message] = [
        Message(author: "webvinic", title: "Item 1", content: "Descrição do item 1", isRead: false),
        Message(author: "webvinic", title: "Item 1", content: "Strong passwords: Use strong passwords, which are like magic keys protecting your spaceshipin cyberspace. They should be a complex mix of letters, numbers, and symbols, making them extremely difficult for intruders to guess. This prevents brute force attacks, where robots try to guess your password repeatedly.", isRead: false),
    ]
    
    @State private var showModal = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List(items) { item in
                NavigationLink(destination: MessageDetailsView(message: item), label: {
                    MessageLineRow(message: item)
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
    MessageView()
}
