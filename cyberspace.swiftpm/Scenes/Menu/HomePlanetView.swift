//
//  HomePlanet.swift
//  cyber.space
//
//  Created by user on 09/02/24.
//

import SwiftUI

struct HomePlanetView: View {
    @EnvironmentObject var event: NextSceneEvent
    
    var body: some View {
        ZStack {
            Image("planet_background_x6")
                .resizable()
            
                .scaledToFill()
                .aspectRatio(contentMode: .fill)
                

            VStack() {
                HStack {
                    Spacer()
                    UIPlanetView()
                }.padding(200)
            }
            .frame(width: .infinity, height: .infinity)
        }
        .frame(width: .infinity, height: .infinity)
        .background(Color(red: 1, green: 0.51, blue: 0.62))
    }
}

// MARK: Interface

struct UIPlanetView: View {
    @EnvironmentObject private var event: NextSceneEvent
    
    var body: some View {
        VStack(spacing: 16) {
            Text("cyber.space")
                .font(.system(size: 64, weight: .bold))
            
            .foregroundColor(.black.opacity(0.75))
            
            Button(action: {
                event.toggleScene()
            }, label: {
                HStack(alignment: .center, spacing: 12) {
                    Text("Start")
                        .font(.title2)
                    
                    Image(systemName: "play.fill")

                }
                .padding(12)
                .background(.thinMaterial)
                .foregroundColor(.black.opacity(0.75))
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
            })
        }
    }
}
