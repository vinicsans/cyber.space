//
//  StandBy.swift
//  cyber.space
//
//  Created by user on 12/02/24.
//

import SwiftUI

struct IdleScene: View {
    @ObservedObject var viewModel = IdleViewModel()

    private let starsBackgroundImage = Image("stars")
    
    var body: some View {
        ZStack {
            starsBackgroundImage
                .resizable()
                .scaledToFill()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            HStack(alignment: .center) {
                ZStack {
                    PlanetView()
                        .background(.clear)
                        .frame(width: 200, height: 200)
                        .background(.clear)
                    
                    Circle()
                        .stroke(Color("Green"), lineWidth: 3)
                        .frame(width: 250, height: 250)
                }
            }
            
            VStack {
                switch viewModel.state {
                case .botAttack:
                    BotAttackScene()
                case .firewallAttack:
                    Text("Logged in")
                case .passwordAttack:
                    Text("Resetting password")
                case .phishingAttack:
                    Text("Resetting password")
                default:
                    UIIdleMenuView(parentViewModel: viewModel)
                }
            }
        }
    }
}

struct PlanetView: View {
    var body: some View {
        Image("aqualis_svg")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .rotationEffect(Angle(degrees: 16))
    }
}

#Preview {
    IdleScene()
}
