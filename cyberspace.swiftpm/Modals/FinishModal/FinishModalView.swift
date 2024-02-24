//
//  SwiftUIView.swift
//  
//
//  Created by user on 24/02/24.
//

import SwiftUI

enum state {
    case good
    case effective
    case veryEffective
}

struct FinishModalView: View {
    
    @State var score = ScoreManager.shared.cyberpoints
    
     var state: state {
        if score <= 33 {
            return .good
        } else if score <= 66 {
            return .effective
        } else if score <= 99 {
            return .veryEffective
        }
         
         return state
    }
    
      var stateText: String {
        switch state {
        case .good:
            "Good."
        case .effective:
            "Effective."
        case .veryEffective:
            "Very Effective."
        }
    }
    
    var body: some View {
        VStack(spacing: 24) {

            switch state {
            case .good:
                HighlightedText(text: genText(state: stateText), highlighted: stateText, color: Constants.Colors.green, size: 20)
                    .font(.system(size: 20))
            case .effective:
                HighlightedText(text: genText(state: stateText), highlighted: stateText, color: Constants.Colors.green, size: 20)
                    .font(.system(size: 20))
            case .veryEffective:
                HighlightedText(text: genText(state: stateText), highlighted: stateText, color: Constants.Colors.green, size: 20)
                    .font(.system(size: 20))
            }
            
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
    
    func genText(state: String) -> String {
        let text = """
        You have successfully reached planet Aqualis! Your courage and determination were essential to overcome the cyber challenges along the way.
        
        Remember that the knowledge acquired on this journey is not only useful in space, but also in real life. Continue improving your cybersecurity skills and never underestimate the power of precaution. If you want to know more, search for "phishing" and "brute-force attack".
        
        Your cyberpoints demonstrate how effective your security actions were; with your score, they were considered: \(state)
        
        Thank you for playing!
        
        made with ❤️
        by web.vinic.
        """
        
        return text
    }
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
