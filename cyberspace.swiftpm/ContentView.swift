import SwiftUI


struct ContentView: View {
                    
    var body: some View {
        NavigationStack {
            IntroScenes(nextScene: AnyView(Test()))
        }
        .toolbar(.hidden)
    }
}
