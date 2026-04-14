//
//  EquivalentCard.swift
//  WorthIt?
//
//  Created by hilda on 13/04/2026.
//

import SwiftUI

struct EquivalentCard: View {
    var prefix: String      // "EQUIVALENT TO" / "OR APPROXIMATELY"
    var value: String       // "156 Espresso Drinks"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(prefix.uppercased())
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
                .tracking(1.2)
            
            Text(value)
                .font(.title3)
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}

// Kalkulasi equivalents dari harga
struct ItemEquivalents {
    static func espressoDrinks(price: Double) -> Int {
        Int(price / 7.5)
    }
    
    static func gymMonths(price: Double) -> Int {
        Int(price / 40)
    }
}

#Preview {
    VStack(spacing: 12) {
        EquivalentCard(prefix: "Equivalent to", value: "156 Espresso Drinks")
        EquivalentCard(prefix: "Or approximately", value: "8 Months of Gym Membership")
    }
    .padding()
}
