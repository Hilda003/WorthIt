//
//  HourseBadge.swift
//  WorthIt?
//
//  Created by hilda on 13/04/2026.
//


import SwiftUI

struct HoursBadge: View {
    var hours: Int
    
    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: "clock.fill")
                .font(.caption)
                .foregroundStyle(.blue)
            
            Text("\(hours) HOURS")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(.primary)
                .tracking(0.8)
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 8)
        .background(Color(.systemGray6))
        .clipShape(Capsule())
    }
}

#Preview {
    HoursBadge(hours: 38)
        .padding()
}
