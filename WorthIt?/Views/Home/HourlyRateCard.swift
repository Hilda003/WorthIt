//
//  HourlyRateCard.swift
//  WorthIt?
//
//  Created by hilda on 13/04/2026.
//

import SwiftUI

struct HourlyRateCard: View {
    var hourlyRate: Double
    var mode: String = "Hourly"
    
    var formattedRate: String {
        CurrencyFormatter.shared.format(hourlyRate)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("\(mode.uppercased()) RATE")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.white.opacity(0.7))
                .tracking(1.2)
            
            Text(formattedRate)
                .font(.system(size: 32, weight: .bold))
                .foregroundStyle(.white)
            
            Text("After-tax estimate")
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.7))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(Color.blue)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    HourlyRateCard(hourlyRate: 26.50)
        .padding()
}
