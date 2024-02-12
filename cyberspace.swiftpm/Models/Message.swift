//
//  File.swift
//  
//
//  Created by user on 12/02/24.
//

import Foundation

struct Message: Identifiable {
    let id = UUID()
    let author: String
    let title: String
    let content: String
    var isRead: Bool
}
