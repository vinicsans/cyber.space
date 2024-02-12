//
//  UIStandByView.swift
//  cyber.space
//
//  Created by user on 12/02/24.
//

import SwiftUI

struct UIStandByView: View {
    
    private let idText = "Spaceship ID - 322883133"
    
    private let cyberPoints = 0
    
    @State private var showModal = false
    
    var body: some View {
        VStack(alignment: .center) {
            HStack (alignment: .top) {
                Text(idText)
                    .foregroundStyle(Color("Text"))
                    .font(.system(size: 28, weight: .bold, design: .monospaced))
                
                Spacer()
                
                Text("Cyberpoints: \(cyberPoints)")
                    .foregroundStyle(Color("Text"))
                    .font(.system(size: 28, weight: .bold, design: .monospaced))
            }
            
            Spacer()
            
            HStack (alignment: .bottom) {
                Text("> ship ready for take-off.")
                    .foregroundStyle(Color("Text"))
                    .font(.system(size: 20, weight: .regular, design: .monospaced))
                
                Spacer()
                
                Button(action: { self.showModal = true }, label: {
                    Image(systemName: "envelope.fill")
                        .foregroundStyle(Color("Text"))
                        .font(.largeTitle)
                })
            }
        }
        .padding(64)
        .sheet(isPresented: $showModal) {
            MessageView()
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ZStack {
        StandByView()
        UIStandByView()
    }
}
