import SwiftUI

struct Constants {
    
    struct Colors {
        static let text = Color(.white)
        static let redText = Color(red: 1, green: 0.35, blue: 0.35)
 
        static let purple = Color(red: 0.36, green: 0.13, blue: 1)
        static let green = Color(red: 0.13, green: 0.85, blue: 0.5)
        static let red = Color(red: 0.85, green: 0.13, blue: 0.13)
        static let orange = Color(red: 0.85, green: 0.56, blue: 0.13)
        
        // Others
        
        static let wine = Color(red: 0.26, green: 0, blue: 0.35).opacity(0.75)
        
        struct Modal {
            static let blueBackground = Color(red: 0.06, green: 0.02, blue: 0.2).opacity(0.8)
            static let redBackground = Color(red: 0.2, green: 0.02, blue: 0.02).opacity(0.7)
            
            static let borderColor = Color(.white)
        }
    }
}
