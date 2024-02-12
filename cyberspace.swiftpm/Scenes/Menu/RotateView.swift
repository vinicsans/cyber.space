//
//  RotateView.swift
//  cyber.space
//
//  Created by user on 09/02/24.
//

import SwiftUI

struct RotateView: View {
    @EnvironmentObject private var event: NextSceneEvent
    
    @State private var blurAmount: Int = 80
    
    var body: some View {
        ZStack {
            Image("planet_background_x6")
                .resizable()
            
                .scaledToFill()
                .aspectRatio(contentMode: .fill)
                .blur(radius: CGFloat(blurAmount), opaque: true)
            
            
            VStack() {
                Text("For this experience, leave your phone in landscape mode.")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.ultraThickMaterial)
                
                Button(action: {
                    event.toggleScene()
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
        }
    }
}

#Preview {
    RotateView()
}

