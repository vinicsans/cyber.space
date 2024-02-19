// File.swift

import Foundation
import SwiftUI

struct PasswordView: View {

    @StateObject var viewModel = PasswordViewModel()
    @State private var isInputTargeted = false

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("To create a password, drag the parts of the desired password into the input field.")
                .foregroundColor(Color(.text))

            HighlightedText(text: "Security: \(viewModel.passwordStrength.title)", highlighted: viewModel.passwordStrength.title, color: viewModel.passwordColor, size: 16)

            PasswordRequirements()

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

            Button(action: {
                print("Confirm password!")
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
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }
}
