//
//  PriceInfoSection.swift
//  WorthIt?
//
//  Created by hilda on 13/04/2026.
//

import SwiftUI

struct PriceInfoSection: View {
    var price: Double
    var hourlyRate: Double
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            VStack(alignment: .leading, spacing: 4) {
                Text("PURCHASE PRICE")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                    .tracking(1.2)
                
                Text("$\(price, specifier: "%.2f")")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundStyle(.blue)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("CURRENT HOURLY RATE")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                    .tracking(1.2)
                
                Text(CurrencyFormatter.shared.format(price))
                    .font(.headline)
                    .foregroundStyle(.primary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    PriceInfoSection(price: 1199, hourlyRate: 45)
        .padding()
}
