//
//  File.swift
//  
//
//  Created by user on 18/02/24.
//

import Foundation
import SwiftUI

struct PasswordFragment: Transferable, Codable, Equatable {
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(for: PasswordFragment.self, contentType: .text)
        
        ProxyRepresentation(exporting: \.content)
    }
    var id = UUID()
    let content: String
}
