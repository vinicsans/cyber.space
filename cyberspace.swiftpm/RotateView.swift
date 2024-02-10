//
//  RotateView.swift
//  cyber.space
//
//  Created by user on 09/02/24.
//

import SwiftUI

struct RotateView: View {
    var body: some View {
        HStack {
            Text("Hello! Before starting the experiment, please set your device to landscape mode.")
            
            Image(systemName: "rectangle.landscape.rotate")
            
            Button (action: {
            }, label: {
                Text("I rotated.")
            })
        }
    }
}

#Preview {
    RotateView()
}

