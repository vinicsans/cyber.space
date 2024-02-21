//
//  File.swift
//  
//
//  Created by user on 17/02/24.
//

import Foundation
import SwiftUI

struct PasswordRequirements: View {
    @ObservedObject var viewModel: PasswordViewModel

    var body: some View {
        WrappedHStack(viewModel.requirements.allRequirements, horizontalSpacing: 8, verticalSpacing: 8) { model in
            Text(model.content)
                .foregroundStyle(model.isValid ? Constants.Colors.green : Constants.Colors.redText)
                .onAppear {
                    print(model)
                }
        }.frame(maxWidth: .infinity)
    }
}
