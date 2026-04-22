//
//  HourseBadge.swift
//  WorthIt?
//
//  Created by hilda on 13/04/2026.
//


import SwiftUI

struct HoursBadge: View {
    var hours: Int

    var displayText: String {
        if hours < 24 {
            return "\(hours) HRS"
        } else if hours < 160 {
            let days = Int((Double(hours) / 8).rounded(.up))
            return "\(days) DAYS"
        } else if hours < 1920 {
            let months = Int(Double(hours) / 160)
            let remainingDays = Int((Double(hours).truncatingRemainder(dividingBy: 160) / 8).rounded(.up))
            
           
            if remainingDays > 3 {
                return "\(months)MO \(remainingDays)D"
            }
            return "\(months) MONTHS"
        } else {
            let years = Int(Double(hours) / 1920)
            let remainingMonths = Int((Double(hours).truncatingRemainder(dividingBy: 1920) / 160).rounded(.up))

            if remainingMonths > 0 {
                return "\(years)YR \(remainingMonths)MO"  
            }
            return "\(years) YEARS"
        }
    }

    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: "clock.fill")
                .font(.caption)
                .foregroundStyle(.blue)

            Text(displayText)
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(.primary)
                .tracking(0.8)
                .minimumScaleFactor(0.6)
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 8)
        .background(Color(.systemGray6))
        .clipShape(Capsule())
    }
}

#Preview {
    VStack(spacing: 12) {
        HoursBadge(hours: 5)
        HoursBadge(hours: 38)
        HoursBadge(hours: 250)
        HoursBadge(hours: 2000)
    }
    .padding()
}
