//
//  SwiftUIView.swift
//  
//
//  Created by user on 17/02/24.
//

import SwiftUI

struct PasswordInput: View {
    var body: some View {
        HStack {
            Text("Drag the parts of the password to form it")
            Spacer()
        }
            .padding(24)
            .font(.system(size: 20))
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity)
            .background(.primary)
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

