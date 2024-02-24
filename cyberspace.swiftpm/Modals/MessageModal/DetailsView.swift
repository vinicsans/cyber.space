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
    @ObservedObject var messageManager: MessageManager

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

            switch message.type {
            case .trued:
                HStack(spacing: 8) {
                    Button(action: {
                        messageManager.submitTrueMessage()
                        presentationMode.wrappedValue.dismiss()
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
                        messageManager.cancelTrueMessage()
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Accept")
                            .padding(12)
                            .foregroundStyle(.black)
                            .frame(maxWidth: .infinity)
                            .background(Constants.Colors.green)
                            .bold()
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    })
                }.frame(width: .infinity)
            case .fake:
                HStack(spacing: 8) {
                    Button(action: {
                        messageManager.cancelFakeMessage()
                        presentationMode.wrappedValue.dismiss()
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
                        messageManager.submitFakeMessage()
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Accept")
                            .padding(12)
                            .foregroundStyle(.black)
                            .frame(maxWidth: .infinity)
                            .background(Constants.Colors.green)
                            .bold()
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    })
                }.frame(width: .infinity)
            case .intro:
                EmptyView()
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
        .onAppear {
            let index = self.messageManager.messages.firstIndex(of: message)!
            self.messageManager.messages[index].isRead = true
            print(self.messageManager.messages)
        }
    }
}
