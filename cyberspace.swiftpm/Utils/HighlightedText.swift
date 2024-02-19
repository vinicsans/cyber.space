//
//  HighlightedText.swift
//  cyber.space
//
//  Created by user on 17/02/24.
//

import Foundation
import SwiftUI

struct HighlightedText: View {
    let text: String
    let highlighted: String
    
    let color: Color
    let size: Int

    var body: some View {
        Text(attributedString)
    }

    private var attributedString: AttributedString {
        var attributedString = AttributedString(text)
        
        attributedString.foregroundColor = Color(.text)

        if let range = attributedString.range(of: highlighted) {
            attributedString[range].font = .system(size: CGFloat(size), weight: .bold)
            attributedString[range].foregroundColor = color
        }

        return attributedString
    }
}
