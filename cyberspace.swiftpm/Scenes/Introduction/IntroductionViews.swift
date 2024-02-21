import SwiftUI

class NextSceneEvent: ObservableObject {
    @Published var actualScene: Int = 0
    
    func toggleScene() {
            actualScene += 1
    }
}

struct IntroScenes: View, GameScene {
    
    var nextScene: AnyView
    
    internal var arrayOfViews: [AnyView] { 
        [
            AnyView(IntroMenuScene()),
            AnyView(IntroPlanetScene(nextScene: AnyView(IdleScene(messageManager: MessageManager(), viewModel: IdleViewModel())))),
        ]
    }
    
    @StateObject private var event = NextSceneEvent()
                    
    var body: some View {
        NavigationStack {
            if (event.actualScene <= arrayOfViews.count - 1) {
                ZStack {
                    arrayOfViews[event.actualScene]
                        .environmentObject(event)
                }
            } else {
                Text("Ops! Cena além do índice.")
            }
        }
        .toolbar(.hidden)
            .onAppear {
                print(arrayOfViews.count - 1)
            }
    }
}
