//
//  HistoryItemRow.swift
//  WorthIt?
//
//  Created by hilda on 14/04/2026.
//

import SwiftUI

struct HistoryItemRow: View {
    var item: WishlistItem
    var hourlyRate: Double
    var mode: String = "Hourly"

    var formattedDate: String {
        guard let date = item.decisionDate else { return "" }
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }

    var body: some View {
        HStack(spacing: 16) {

      
            if let data = item.imageData, let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            } else {
                InitialPlaceholderView(
                    initial: item.initial,
                    color: item.placeholderColor,
                    size: 80
                )
            }

            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(item.name)
                        .font(.headline)
                        .lineLimit(1)
                        .minimumScaleFactor(0.6)
                      
                    Spacer()
                    Text(CurrencyFormatter.shared.format(item.price))
                        .font(.headline)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .fixedSize(horizontal: true, vertical: false)
                }
                HStack(spacing: 8) {
                    HoursBadge(hours: item.hoursNeeded(hourlyRate: hourlyRate, mode: mode))
                    StatusBadge(status: item.status)
                }
                Text(formattedDate)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.04), radius: 6, y: 3)
    }
}

#Preview {
    HistoryItemRow(
        item: WishlistItem(
            name: "Espresso Machine",
            price: 599,
            status: .purchased,
            decisionDate: Date()
        ),
        hourlyRate: 26.50
    )
    .padding()
}
