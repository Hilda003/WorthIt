//
//  HoursSavedCard.swift
//  WorthIt?
//
//  Created by hilda on 14/04/2026.
//

import SwiftUI

struct HoursSavedCard: View {
    var hoursSaved: Int

    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "stopwatch.fill")
                .font(.title)
                .foregroundStyle(.blue)
                .frame(width: 60, height: 60)
                .background(Color.blue.opacity(0.12))
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 4) {
                Text("\(hoursSaved) hours saved")
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.blue)

                Text("THIS MONTH")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                    .tracking(1.2)
            }

            Spacer()
        }
        .padding(20)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }
}

#Preview {
    HoursSavedCard(hoursSaved: 47)
        .padding()
}
