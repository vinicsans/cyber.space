//
//  RotateView.swift
//  cyber.space
//
//  Created by user on 09/02/24.
//

import SwiftUI

struct RotateView: View {
    @EnvironmentObject private var event: NextSceneEvent
    
    @State private var blurAmount: CGFloat = 80
    @State private var opacityAmount: Double = 100
    
    var body: some View {
        ZStack {
            Image("planet_background_x6")
                .resizable()
            
                .scaledToFill()
                .aspectRatio(contentMode: .fill)
                .blur(radius: blurAmount, opaque: true)
                .animation(.smooth(duration: 0.3), value: blurAmount)
            
            VStack() {
                Text("For this experience, leave your phone in landscape mode.")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.ultraThickMaterial)
                
                Button(action: {
                    finishAnimation()
                }, label: {
                    Text("Confirm")
                        .font(.title3)
                    
                    Image(systemName: "rotate.right.fill")
                        .padding(EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 0))
                })
                .padding(16)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 24))
            }
            .opacity(opacityAmount)
            .animation(.smooth(duration: 0.1), value: opacityAmount)
        }
    }
}

// Animation

extension RotateView {
    func finishAnimation() {
        opacityAmount = 0
        blurAmount = 0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
            event.toggleScene()
        }
    }
}

#Preview {
    RotateView()
}

