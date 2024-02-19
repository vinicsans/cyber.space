//
//  SwiftUIView.swift
//  
//
//  Created by user on 17/02/24.
//

import SwiftUI

struct FragmentView: View {
    
    @State var fragment: PasswordFragment
    
    var body: some View {
        Text(fragment.content)
                .foregroundStyle(.white)
                .padding(12)
                .bold()
                .background(Color(.purple))
                .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
