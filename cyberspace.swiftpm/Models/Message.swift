//
//  File.swift
//  
//
//  Created by user on 12/02/24.
//

import Foundation

struct Message: Identifiable, Hashable {
    let id = UUID()
    
    let authorEmail: String
    let authorName: String
    let content: String
    var isRead: Bool
}
