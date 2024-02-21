import SwiftUI

struct BotAttackScene: View, GameScene {
    private let starsBackgroundImage = Image("stars")
    private let spaceShipAttackImage = Image("spaceship_attack")
    
    var nextScene: AnyView = AnyView(IdleScene(nextScene: AnyView(Test2View()), messageManager: MessageManager(), viewModel: IdleViewModel()))
    
    var body: some View {
        ZStack {
            starsBackgroundImage
                .resizable()
                .scaledToFill()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            spaceShipAttackImage
                .resizable()
                .scaledToFill()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Robots are trying to hack into the ship's access system!")
                        .font(.system(size: 40))
                        .foregroundStyle(Constants.Colors.text)
                        .bold()
                        .frame(maxWidth: 532)
                    
                    Spacer()
                }
                .padding(64)
                
                Spacer()
            }
        }
        .ignoresSafeArea()
        .frame(width: .infinity, height: .infinity)
    }
}

#Preview {
    BotAttackScene()
}
