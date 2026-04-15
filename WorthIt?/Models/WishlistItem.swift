//
//  WishlistItem.swift
//  WorthIt?
//
//  Created by hilda on 13/04/2026.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class WishlistItem {
    var id: UUID
    var name: String
    var price: Double
    var imageData: Data?
    var statusRaw: String
    var decisionDate: Date?

    init(name: String, price: Double, imageData: Data? = nil, status: ItemStatus = .wishlist, decisionDate: Date? = nil) {
        self.id = UUID()
        self.name = name
        self.price = price
        self.imageData = imageData
        self.statusRaw = status.rawValue
        self.decisionDate = decisionDate
    }
    var status: ItemStatus {
        get { ItemStatus(rawValue: statusRaw) ?? .wishlist }
        set { statusRaw = newValue.rawValue }
    }
}

extension WishlistItem {
    var initial: String {
        String(name.prefix(1)).uppercased()
    }

    var placeholderColor: Color {
        let colors: [Color] = [.blue, .green, .orange, .purple, .red, .teal, .indigo]
        let index = abs(name.hashValue) % colors.count
        return colors[index]
    }
    
    func hoursNeeded(hourlyRate: Double, mode: String = "Hourly") -> Int {
            guard hourlyRate > 0 else { return 0 }
            let effectiveHourlyRate = mode == "Monthly" ? hourlyRate / 160 : hourlyRate
            return Int((price / effectiveHourlyRate).rounded(.up))
        }
}


