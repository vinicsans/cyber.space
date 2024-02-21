// File.swift

import Foundation
import SwiftUI

struct PasswordView: View {

    @StateObject var scoreManager: ScoreManager
    @StateObject var viewModel = PasswordViewModel()
    
    let onCloseAction: () -> Void
    
    @State private var isInputTargeted = false

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("To create a password, drag the parts of the desired password into the input field.")
                .foregroundColor(Constants.Colors.text)

            HighlightedText(text: "Security: \(viewModel.passwordSecurity.content)", highlighted: viewModel.passwordSecurity.content, color: viewModel.passwordColor, size: 16)

            PasswordRequirements(viewModel: viewModel)

            PasswordInput(fragmentViewModel: viewModel, isTargeted: isInputTargeted)
                .dropDestination(for: PasswordFragment.self) { fragments, location in
                    viewModel.addDroppedFragments(fragments)
                    
                    switch viewModel.passwordSecurity.state {
                    case .weak:
                        print("error")
                    case .medium:
                        scoreManager.addPoints(bonus: .average)
                    case .strong:
                        scoreManager.addPoints(bonus: .very)
                    }                    
                    
                    return true
                } isTargeted: { isTarget in
                    isInputTargeted = isTarget
                }

            WrappedHStack(viewModel.undroppedFragments, horizontalSpacing: 12, verticalSpacing: 12) { fragment in
                Text(fragment.content)
                    .foregroundColor(Constants.Colors.text)
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
                onCloseAction()
            }) {
                Text("Confirm password")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Constants.Colors.green)
                    .foregroundColor(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
