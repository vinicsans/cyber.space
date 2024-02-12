import SwiftUI

class NextSceneEvent: ObservableObject {
    @Published var actualScene: Int = 0
    
    func toggleScene() {
            actualScene += 1
    }
}

struct IntroductionViews: View {
    internal let arrayOfViews: [AnyView] = [
        AnyView(RotateView()),
        AnyView(HomePlanetView()),
        AnyView(HomePlanetIntro()),
    ]
    
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
