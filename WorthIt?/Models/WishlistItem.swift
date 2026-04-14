//
//  WishlistItem.swift
//  WorthIt?
//
//  Created by hilda on 13/04/2026.
//


import Foundation
import SwiftUI

struct WishlistItem: Identifiable {
    let id = UUID()
    var name: String
    var price: Double
    var imageData: Data? = nil

    func hoursNeeded(hourlyRate: Double) -> Int {
        guard hourlyRate > 0 else { return 0 }
        return Int((price / hourlyRate).rounded(.up))
    }

    var initial: String {
        String(name.prefix(1)).uppercased()
    }

    var placeholderColor: Color {
        let colors: [Color] = [.blue, .green, .orange, .purple, .red, .teal, .indigo]
        let index = abs(name.hashValue) % colors.count
        return colors[index]
    }
}
