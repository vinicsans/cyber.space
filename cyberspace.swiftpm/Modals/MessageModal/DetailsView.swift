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

        VStack(alignment: .leading, spacing: 4) {
            Text(.init(message.content))
            
            Spacer()
            
            HStack {
                Text("De: \(message.authorEmail)")
                    .font(.system(size: 16, design: .monospaced))
                
                Spacer()
                
                Text("Enviado hoje")
                    .font(.system(size: 16, design: .monospaced))
            }
            
            Spacer()
            
            HStack(spacing: 8) {
                Button(action: {
                    
                }, label: {
                    Text("Decline")
                        .padding(12)
                        .foregroundStyle(Constants.Colors.text)
                        .frame(maxWidth: .infinity)
                        .background(Constants.Colors.red)
                        .bold()
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                })
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("Accept")
                        .padding(12)
                        .foregroundStyle(Constants.Colors.green)
                        .frame(maxWidth: .infinity)
                        .background(Color(.green))
                        .bold()
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                })
            }.frame(width: .infinity)
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
