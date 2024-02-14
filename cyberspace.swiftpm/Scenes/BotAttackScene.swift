import SwiftUI

struct BotAttackScene: View {
    private let starsBackgroundImage = Image("stars")
    private let spaceShipAttackImage = Image("spaceship_attack")
    
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
                        .foregroundStyle(.thickMaterial)
                        .bold()
                        .frame(maxWidth: 532)
                    
                    Spacer()
                }
                .padding(EdgeInsets(top: 48, leading: 24, bottom: 0, trailing: 0))
                
                Spacer()
            }
        }
    }
}

#Preview {
    BotAttackScene()
}
