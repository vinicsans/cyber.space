import SwiftUI

struct BotAttackScene: View {
    private let starsBackgroundImage = Image("stars")
    private let spaceShipAttackImage = Image("spaceship_attack")
    
    @Environment(\.presentationMode) var presentationMode

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
                .padding(EdgeInsets(top: 64, leading: 32, bottom: 0, trailing: 0))
                
                Spacer()
                
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Back to the ship")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.white)
                    })
                    .padding(24)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .padding(EdgeInsets(top: 0, leading: 32, bottom: 64, trailing: 0))

                    
                    Spacer()
                }
                
            }
        }
        .ignoresSafeArea()
        .frame(width: .infinity, height: .infinity)
    }
}

#Preview {
    BotAttackScene()
}
