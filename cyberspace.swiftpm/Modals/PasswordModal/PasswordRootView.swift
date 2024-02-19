// File.swift

import Foundation
import SwiftUI

struct PasswordView: View {

    @StateObject var viewModel = PasswordViewModel()
    @State private var isInputTargeted = false

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("To create a password, drag the parts of the desired password into the input field.")
                .foregroundColor(Color(.text))

            HighlightedText(text: "Security: \(viewModel.passwordSecurity.content)", highlighted: viewModel.passwordSecurity.content, color: viewModel.passwordColor, size: 16)

            PasswordRequirements(viewModel: viewModel)

            PasswordInput(fragmentViewModel: viewModel, isTargeted: isInputTargeted)
                .dropDestination(for: PasswordFragment.self) { fragments, location in
                    viewModel.addDroppedFragments(fragments)
                    return true
                } isTargeted: { isTarget in
                    isInputTargeted = isTarget
                }

            WrappedHStack(viewModel.undroppedFragments, horizontalSpacing: 12, verticalSpacing: 12) { fragment in
                Text(fragment.content)
                    .foregroundColor(.white)
                    .padding(12)
                    .bold()
                    .background(Color(.purple))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .draggable(fragment)
            }
            .frame(maxWidth: .infinity)
            .dropDestination(for: PasswordFragment.self) { fragments, location in
                viewModel.removeDroppedFragments(fragments)
                return false
            }

            Button(action: {
                
                let isValid = viewModel.requirements.isValid
                
                if isValid {
                    print("Conseguiu!")
                } else {
                    print("meh")
                }
                
            }) {
                Text("Confirm password")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}