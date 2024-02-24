import SwiftUI

struct BotAttackScene: View {
    private let starsBackgroundImage = Image("stars")
    private let spaceShipAttackImage = Image("spaceship")
    
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
                .padding(EdgeInsets(top: 0, leading: -134, bottom: 0, trailing: 0))
                .scaledToFill()
                .aspectRatio(contentMode: .fill)
            
            VStack(alignment: .trailing) {
                
                HStack {
                    
                    Spacer()
                    
                    Text("Robots are trying to hack into the ship's access system!")
                        .font(.system(size: 40))
                        .foregroundStyle(Constants.Colors.text)
                        .bold()
                        .frame(maxWidth: 532)
                        .multilineTextAlignment(.trailing)
                        
                    
                }
                
                Spacer()
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Back to the ship")
                        .padding(24)
                        .foregroundStyle(Constants.Colors.Modal.blueBackground)
                        .background(.regularMaterial)
                        .font(.title)
                        .bold()
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                        .padding(24)
                })

            }
            .padding(EdgeInsets(top: 64, leading: 32, bottom: 32, trailing: 80))
            .frame(width: .infinity, height: .infinity)
        }
    }
}

#Preview {
    BotAttackScene()
}
