import SwiftUI

struct PasswordInput: View {
    @ObservedObject var fragmentViewModel: PasswordViewModel
    
    let isTargeted: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            if fragmentViewModel.droppedFragments.count > 0 {
                WrappedHStack(fragmentViewModel.droppedFragments, horizontalSpacing: 6, verticalSpacing: 6) { fragment in
                    FragmentView(fragment: fragment)
                        .draggable(fragment)
                }
                .frame(maxWidth: .infinity)
                .padding(24)
            } else {
                Text("Drag the parts of the password to form it")
                    .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 0))
                    .font(.system(size: 20))
            }
        }
        .foregroundStyle(.black)
        .frame(maxWidth: .infinity, minHeight: 80, alignment: .leading)
        .background(self.isTargeted ? Color(red: 1.0, green: 1, blue: 1.0, opacity: 0.75) : Color(red: 1.0, green: 1, blue: 1.0, opacity: 0.95))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

