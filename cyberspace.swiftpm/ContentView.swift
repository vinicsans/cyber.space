import SwiftUI


struct ContentView: View {
                    
    var body: some View {
        NavigationStack {
            IntroductionViews()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        }
        .toolbar(.hidden)
    }
}
