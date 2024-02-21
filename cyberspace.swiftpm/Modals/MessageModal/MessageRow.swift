//
//  File.swift
//  
//
//  Created by user on 12/02/24.
//

import Foundation
import SwiftUI

struct MessageLineRow: View {
    let message: Message
    
    var body: some View {
        HStack {
            if message.isRead == true {
                Text("\(message.authorName): \(message.content)")
                    .lineLimit(1)
            } else {
                Text("Nova mensagem de \(message.authorName)")
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
