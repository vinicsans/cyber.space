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
        
    @State private var rotation: Double = 0.0
    
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
                        .rotationEffect(.degrees(rotation))
                        .animation(Animation.linear(duration: 180.0).repeatForever(autoreverses: false))
                        .onAppear {
                            rotation = 360
                        }
                        .background(.clear)
                        .frame(width: 200, height: 200)

                }
            }

            VStack {
                switch viewModel.state {
                    
                case .botAttack:
                    AlertModal(showModal: $viewModel.showModalInAction, alertType: .securityInvasion, showClose: false, onClick: {
                        viewModel.nextEvent(viewModel.state, withTimer: false)
                    })
                case .passwordAttack:
                    Modal(showModal: showModal,
                          showClose: false,
                          title: "// RESET PASSWORD",
                          content: PasswordView(scoreManager: scoreManager, onCloseAction: { viewModel.nextEvent(.passwordAttack, withTimer: false) })
                    )
                    
                case .phishingAttack:
                    UIIdleMenuView(parentViewModel: viewModel, scoreManager: self.scoreManager, messageManager: messageManager, state: .message, isErrorMode: false)
                    .onAppear {
                        messageManager.addTrueMessage()
                        messageManager.addFakeMessage()
                    }
                case .idle:
                    UIIdleMenuView(parentViewModel: viewModel, scoreManager: self.scoreManager, messageManager: messageManager, state: .idle, isErrorMode: false)
                    
                case .homeIdle:
                    UIIdleMenuView(parentViewModel: viewModel, scoreManager: self.scoreManager, messageManager: messageManager, state: .homeIdle, isErrorMode: false)
                case .finishModal:
                    Modal(showModal: showModal, showClose: false, title: "Congratulations, the trip was a success!", content: FinishModalView())
                }
            }
        }
    }
}

struct PlanetView: View {
    var body: some View {
        ZStack {
            Image("aqualis_svg")
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            Circle()
                .stroke(Constants.Colors.green, lineWidth: 3)
                .padding(-24)
        }
    }
}

#Preview {
    IdleScene()
}
