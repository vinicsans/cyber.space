import SwiftUI

struct MessageView: View {
    
    let items: [Message] = [
        Message(author: "webvinic", title: "Item 1", content: "Descrição do item 1", isRead: false),
        Message(author: "webvinic", title: "Item 1", content: "Descrição do item 1", isRead: false),
    ]
    
    @State private var showModal = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List(items) { item in
               MessageLineRow(message: item)
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

struct MessageLineRow: View {
    let message: Message
    
    var body: some View {
        HStack {
            if message.isRead == true {
                Text("\(message.author): \(message.content)")
            } else {
                Text("Nova mensagem de \(message.author)")
                    .bold()
                
                Spacer()
                
                MessagePin()
            }
        }
    }
}

struct MessagePin: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(.red)
                .frame(width: 32, height: 32)
            
            Text("+1")
                .font(.system(size: 16))
                .bold()
                .foregroundStyle(.white)
        }
        .padding(6)
    }
}

#Preview {
    MessageView()
}
