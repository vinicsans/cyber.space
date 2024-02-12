//
//  HomePlanet.swift
//  cyber.space
//
//  Created by user on 09/02/24.
//

import SwiftUI

struct HomePlanetView: View {
    @EnvironmentObject var event: NextSceneEvent
    
    private let backgroundImage = Image("planet_background_x6")

    var body: some View {
        ZStack {
            backgroundImage
                .resizable()
                .scaledToFill()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)

            HStack(alignment: .center) {
                Spacer()
                UIPlanetView()
            }
            .padding(196)
        }
    }
}

// MARK: Interface

struct UIPlanetView: View {
    @EnvironmentObject private var event: NextSceneEvent
    @State private var opacityAmount: Double = 0

    var body: some View {
        VStack(spacing: 16) {
            Text("cyber.space")
                .font(.system(size: 64, weight: .bold))
                .foregroundColor(.black.opacity(0.75))

            Button(action: { finishAnimation() }, label: {
                Label("Start", systemImage: "play.fill")
                    .font(.title2)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 24)
                    .background(.thinMaterial)
                    .foregroundColor(.black.opacity(0.75))
                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
            })
        }
        .opacity(opacityAmount)
        .animation(.easeInOut(duration: 1), value: opacityAmount)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Int(0.300))) {
                startAnimation()
            }
        }
    }
}


// Animation

extension UIPlanetView {
    func startAnimation() {
        opacityAmount = 100
    }
    
    func finishAnimation() {
        opacityAmount = 0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Int(1))) {
            event.toggleScene()
        }
    }
}


#Preview {
    HomePlanetView()
}

