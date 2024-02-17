//
//  File.swift
//  
//
//  Created by user on 16/02/24.
//

import Foundation
import SwiftUI

struct PasswordView: View {

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("To create a password, drag the parts of the desired password into the input field.")
                                    
            HighlightedText(text: "Security: Strong", highlighted: "Strong", color: .green, size: 16)
            
            PasswordRequirements()
            
            PasswordInput()
            
            FragmentsView()
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }
}

