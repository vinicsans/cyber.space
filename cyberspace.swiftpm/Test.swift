import SwiftUI

struct Test: View {
    var body: some View {
        NavigationStack {
            TestView(nextView: AnyView(Test2View()))
        }
    }
}

struct TestView: View {
    
   let nextView: AnyView 
    
    var body: some View {
        Text("Hello")
        
        NavigationLink(destination: nextView, label: {
            Text("me")
        })
    }
    
}

struct Test2View: View {
    
    var body: some View {
        Text("Hello 2")

    }
    
}
