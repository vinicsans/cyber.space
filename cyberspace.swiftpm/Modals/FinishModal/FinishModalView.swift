//
//  SwiftUIView.swift
//  
//
//  Created by user on 24/02/24.
//

import SwiftUI

struct FinishModalView: View {
    
    var body: some View {
        VStack(spacing: 24) {
            
            HighlightedText(text: finishMessage, highlighted: "Very Effective.", color: Constants.Colors.green, size: 24)
                .font(.title3)
            
            NavigationLink(destination: IntroScenes(), label: {
                Text("Start again")
                    .font(.system(size: 16, design: .monospaced))
                    .foregroundStyle(.white)
                    .bold()
            })
            .padding(16)
            .frame(maxWidth: .infinity)
            .background(.white.opacity(0.25))
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
    
    let finishMessage = """
    
    You have successfully reached planet Aqualis! Your courage and determination were essential to overcome the cyber challenges along the way.

    Remember that the knowledge acquired on this journey is not only useful in space, but also in real life. Continue improving your cybersecurity skills and never underestimate the power of precaution. If you want to know more, search for "phishing" and "brute-force attack".

    Your cyberpoints demonstrate how effective your security actions were; with your score, they were considered: Very Effective.

    Thank you for playing!
    
    made with ❤️
    by web.vinic.
    """
}


struct TestViewModal: View {
    
    @State var isTrue: Bool = true
    
    var body: some View {
        Modal(showModal: $isTrue, showClose: false, title: "// Congratulations, the trip was a success!", content: FinishModalView())
    }
}

#Preview {
    TestViewModal()
}
