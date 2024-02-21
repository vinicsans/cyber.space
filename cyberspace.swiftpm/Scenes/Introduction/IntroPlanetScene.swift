import SwiftUI

struct IntroPlanetScene: View, GameScene {
    
    var nextScene: AnyView

    @EnvironmentObject var event: NextSceneEvent

    private let planetBackgroundImage = Image("planet_background_x6")

    var body: some View {
        ZStack {
            planetBackgroundImage
                .resizable()
                .scaledToFill()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)

            HStack(alignment: .center) {
                Spacer()
                PlanetIntroView(nextScene: nextScene)
            }
            .padding(100)
        }
    }
}

struct PlanetIntroView: View, GameScene {
    
    var nextScene: AnyView
    
    @EnvironmentObject private var event: NextSceneEvent
    @State private var isVisible = false

    private let introText = """
    Hello, Commander! You are Michael, a fearless space explorer seeking tranquility on the remote planet Aqualis. However, your journey is filled with cybernetic challenges. Just as protecting your spaceship is vital, protecting your devices and data is crucial on Earth. Use the concepts learned here ;)
    """

    var body: some View {
        VStack(spacing: 12) {
            Text(introText)
                .font(.system(size: 24))
                .foregroundStyle(Constants.Colors.text)
                .padding(32)
                .background(Color(red: 0.26, green: 0, blue: 0.35).opacity(0.63))
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 24))

            NavigationLink {
                nextScene
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                    .statusBar(hidden: true)
            } label: {
                Text("Start Mission")
                    .bold()
                    .foregroundStyle(Constants.Colors.text)
                Image(systemName: "arrow.right")
                    .foregroundStyle(Constants.Colors.text)
            }
            .padding(24)
            .frame(maxWidth: 424)
            .background(Constants.Colors.wine)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 24))
        }
        .frame(maxWidth: 424)
        .opacity(isVisible ? 1 : 0)
        .animation(.easeInOut(duration: 1), value: isVisible)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(3)) {
                showIntro()
            }
        }
    }

    private func showIntro() {
        isVisible = true
    }
}

#Preview {
    IntroPlanetScene(nextScene: AnyView(Test()))
}
