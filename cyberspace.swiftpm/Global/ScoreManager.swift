//
//  File.swift
//  
//
//  Created by user on 21/02/24.
//

import Foundation
import SwiftUI

enum Bonus {
    case average
    case very
}

class ScoreManager: ObservableObject {
    @Published var cyberpoints: Int = 0
    
    private let featuresAmount = 3
    private let pointsAtFeature = 100 / 3
    
    public func addPoints(bonus: Bonus) {
        var featurePoints = pointsAtFeature
        
        if bonus == .average {
            featurePoints -= 10
        }
        
        cyberpoints += featurePoints
        print(cyberpoints)
    }
}
