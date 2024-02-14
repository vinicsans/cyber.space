//
//  SwiftUIView.swift
//
//
//  Created by user on 12/02/24.
//

import SwiftUI

struct MessageDetailsView: View {
    var message: Message
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {

        VStack (alignment: .leading) {
            Text(.init(message.content))
            
            Spacer()
            
            HStack {
                Text("De: \(message.authorEmail)")
                    .font(.system(size: 16, design: .monospaced))
                
                Spacer()
                
                Text("Enviado hoje")
                    .font(.system(size: 16, design: .monospaced))
            }
        }
        .padding(EdgeInsets(top: 0, leading: 24, bottom: 24, trailing: 24))
        .navigationTitle("Message from \(message.authorName)")
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

#Preview {
    MessageDetailsView(message: Message(authorEmail: "webVinic", authorName: "Hello", content: "**Hello**, michel.", isRead: false))
}
