//
//  File.swift
//  
//
//  Created by user on 12/02/24.
//

import Foundation

enum MessageType {
    case intro
    case trued
    case fake
}

struct Message: Identifiable, Equatable {
    let id = UUID()
    
    let type: MessageType
    
    let authorEmail: String
    let authorName: String
    var isRead: Bool
    let popUp: Bool
    let isFake: Bool
    let content: String
}
