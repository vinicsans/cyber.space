import SwiftUI

struct Modal<Content: View >: View {
    @Binding var showModal: Bool
    
    let title: String
    let content: Content
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.gray.opacity(0.2), lineWidth: 1))
                .foregroundStyle(.thickMaterial)
            
            VStack(spacing: 12) {
                Header(title: title)
                
                Spacer()
                
                ScrollView {
                    content
                }
                .multilineTextAlignment(.leading)
            }
            .padding(32)
        }
        .frame(maxWidth: 886, maxHeight: 632)
        .preferredColorScheme(.dark)
    }
}

extension Modal {
    struct Header: View {
        let title: String
        
        var body: some View {
            HStack {
                Text(title)
                    .font(.system(size: 28, weight: .bold, design: .monospaced))
                    .foregroundStyle(Color(.redText))
                
                Spacer()

                Button(action: {
                    
                }, label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 16))
                        .frame(width: 32, height: 32)
                        .background(.quaternary)
                        .clipShape(Circle())
                })
            }
        }
    }
}
