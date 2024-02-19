//
//  SwiftUIView.swift
//  
//
//  Created by user on 19/02/24.
//

import SwiftUI

struct Header: View {
    let showButton: Bool
    let title: String
    
    let onCloseAction: () -> Void
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 28, weight: .bold, design: .monospaced))
                .foregroundStyle(Color(.redText))
            
            Spacer()
            
            if showButton {
                Button(action: {
                    onCloseAction()
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
