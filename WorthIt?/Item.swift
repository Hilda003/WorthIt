//
//  Item.swift
//  WorthIt?
//
//  Created by hilda on 07/04/2026.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
