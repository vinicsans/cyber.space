import SwiftUI

struct ContentView: View {
    @State private var isRotate: Bool = false
    
    var body: some View {
        
        if isRotate == false {
            VStack(spacing: 24) {
                Text("Hello! Before starting the experiment, please set your device to landscape mode.")
                    .font(.title3)

                                
                Button (action: {
                    isRotate = true
                }, label: {
                    Text("I rotated.")
                    Image(systemName: "rectangle.landscape.rotate")
                }).padding(12)
                    .background(.quinary)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            }
        } else {
            HomePlanetView()
                .frame(width: .infinity, height: .infinity)
        }
    }
}
