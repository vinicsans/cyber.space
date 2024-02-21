//
//  StandBy.swift
//  cyber.space
//
//  Created by user on 12/02/24.
//

import SwiftUI

struct IdleScene: View, GameScene {
    
    var nextScene: AnyView = AnyView(Test2View())
    
    @ObservedObject var messageManager = MessageManager()
    @ObservedObject var scoreManager = ScoreManager()
    @ObservedObject var viewModel = IdleViewModel()
    
    @State var homeIdle = true
    
    private var showModal: Binding<Bool> {
        $viewModel.showModalInAction
    }
    
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
                        .stroke(Constants.Colors.green, lineWidth: 3)
                        .frame(width: 250, height: 250)
                }
            }

            VStack {
                switch viewModel.state {
                    
                case .botAttack:
                    AlertModal(showModal: $viewModel.showModalInAction, alertType: .securityInvasion, showClose: false, onClick: {
                        viewModel.nextEvent(viewModel.state, withTimer: false)
                    })
                case .firewallAttack:
                    Text("Logged in")
                    
                case .passwordAttack:
                    Modal(showModal: showModal,
                          showClose: false,
                          title: "// RESET PASSWORD",
                          content: PasswordView(scoreManager: scoreManager, onCloseAction: { viewModel.nextEvent(.passwordAttack, withTimer: false) })
                    )
                    
                case .phishingAttack:
                    UIIdleMenuView(parentViewModel: viewModel)
                    .onAppear {
                        MessageManager.shared.addTrueMessage()
                        MessageManager.shared.addFakeMessage()
                    }
                case .idle:
                    UIIdleMenuView(parentViewModel: viewModel)
                        .onAppear {
                                viewModel.nextEvent(.idle, withTimer: true)
                        }
                    
                case .homeIdle:
                    UIIdleMenuView(parentViewModel: viewModel)
                        .onDisappear {
                            viewModel.nextEvent(.homeIdle, withTimer: true)
                        }
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
