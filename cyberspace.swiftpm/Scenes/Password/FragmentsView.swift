//
//  SwiftUIView.swift
//  
//
//  Created by user on 17/02/24.
//

import SwiftUI

struct FragmentsView: View {
    let fragments: [PasswordPart] = [
        PasswordPart(content: "12345"),
        PasswordPart(content: "12345VQABD"),
        PasswordPart(content: "admin"),
        PasswordPart(content: "qwerty"),
        PasswordPart(content: "themasterofpuppet"),
        PasswordPart(content: "mainlol123"),
        PasswordPart(content: "35745873639qVc^>"),
        PasswordPart(content: "849375"),
        PasswordPart(content: "J[1W9i7"),
        PasswordPart(content: "theM8230384")
    ]
    
    var body: some View {
        WrappedHStack(fragments, horizontalSpacing: 12, verticalSpacing: 12) { model in
            Text(model.content)
                .foregroundStyle(.white)
                .padding(12)
                .bold()
                .background(Color(.purple))
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }.frame(maxWidth: .infinity)
    }
}
