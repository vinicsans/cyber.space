import SwiftUI
import AVFoundation

class NextSceneEvent: ObservableObject {
    @Published var actualScene: Int = 0
    
    func toggleScene() {
            actualScene += 1
    }
}

struct IntroScenes: View {
    
    @State private var player: AVAudioPlayer?
        
    internal var arrayOfViews: [AnyView] { 
        [
            AnyView(IntroMenuScene()),
            AnyView(IntroPlanetScene(nextScene: AnyView(IdleScene()))),
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
                let url = URL(fileURLWithPath: Bundle.main.path(forResource: "music", ofType: "mp3")!)
                player = try? AVAudioPlayer(contentsOf: url)
                
                player?.numberOfLoops = -1
                player?.play()
            }
    }
}
