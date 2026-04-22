//
//  WishlistItemRow.swift
//  WorthIt?
//
//  Created by hilda on 13/04/2026.
//

import SwiftUI

struct WishlistItemRow: View {
   @Binding var item: WishlistItem
    var hourlyRate: Double
    var mode: String = "Hourly"
    
    var body: some View {
        HStack(spacing: 16) {
            
            // Gambar item
            ItemImageView(
                imageData: Binding(
                    get: { item.imageData },
                    set: { item.imageData = $0 }  
                ),
                initial: item.initial,
                color: item.placeholderColor
            )
            
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(item.name)
                        .font(.headline)
                    
                    Spacer()
                    Button {
                       
                    } label: {
                        Image(systemName: "ellipsis")
                            .foregroundStyle(.secondary)
                    }
                }
                
                Text(CurrencyFormatter.shared.format(item.price))
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                HoursBadge(hours: item.hoursNeeded(hourlyRate: hourlyRate, mode: mode))
            }
        }
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.04), radius: 6, y: 3)
    }
}


