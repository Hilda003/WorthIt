//
//  CurrentGoalCard.swift
//  WorthIt?
//
//  Created by hilda on 13/04/2026.
//

import SwiftUI

struct CurrentGoalCard: View {
    var goalName: String
    var hoursRemaining: Int
    var progress: Double
    
    var progressPercent: Int {
        Int(progress * 100)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Text("CURRENT GOAL")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
                .tracking(1.2)
            
            Text(goalName)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.blue)
            
            HStack {
                Text("\(hoursRemaining) hours of focus remaining")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 3) {
                    Text("\(progressPercent)%")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundStyle(.blue)
                    Text("Earned")
                        .font(.caption)
                        .foregroundStyle(.blue)
                }
            }
            
            // Progress bar
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color(.systemGray5))
                        .frame(height: 6)
                    
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.blue)
                        .frame(width: geo.size.width * progress, height: 6)
                }
            }
            .frame(height: 6)
        }
        .padding(20)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }
}

#Preview {
    CurrentGoalCard(
        goalName: "iPhone 15 Pro",
        hoursRemaining: 38,
        progress: 0.65
    )
    .padding()
}
