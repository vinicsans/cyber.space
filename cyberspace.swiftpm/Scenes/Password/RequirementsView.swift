//
//  File.swift
//  
//
//  Created by user on 17/02/24.
//

import Foundation
import SwiftUI

struct PasswordRequirements: View {
    @State var requirements: [Requirement] = [
        Requirement(type: .more12Char),
        Requirement(type: .useNumbers),
        Requirement(type: .useLetters),
        Requirement(type: .useSpecialChar),
        Requirement(type: .notUseCommonWords),
        Requirement(type: .noSequences)
    ]
    
    var body: some View {
        WrappedHStack(requirements, horizontalSpacing: 12, verticalSpacing: 12) { model in
            Text(model.content)
                .foregroundStyle(Color(.redText))
        }.frame(maxWidth: .infinity)
    }
}
