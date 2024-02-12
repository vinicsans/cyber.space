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
        VStack(alignment: .center) {
            Text(message.content)
                .multilineTextAlignment(.leading)
        }
            .padding(32)
            .frame(width: .infinity)
            .navigationTitle(message.title)
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
    MessageDetailsView(message: Message(author: "webVinic", title: "Hello", content: "aaa", isRead: false))
}
