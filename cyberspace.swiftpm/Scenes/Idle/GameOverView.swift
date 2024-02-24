//
//  SwiftUIView.swift
//  
//
//  Created by user on 24/02/24.
//

import SwiftUI

struct GameOverView: View {
    
    @State var showModal = true
    
    private let starsBackgroundImage = Image("stars")
    
    var body: some View {
        ZStack {
            
            starsBackgroundImage
                .resizable()
                .scaledToFill()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            UIIdleMenuView(parentViewModel: IdleViewModel(), scoreManager: ScoreManager(), messageManager: MessageManager(), state: .homeIdle, isErrorMode: true)
            
            AlertModal(showModal: $showModal, alertType: .error, showClose: false, onClick: {})
        }
    }
}

#Preview {
    GameOverView()
}
