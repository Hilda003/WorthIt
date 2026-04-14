//
//  ItemDetailView.swift
//  WorthIt?
//
//  Created by hilda on 13/04/2026.
//

import SwiftUI

struct ItemDetailView: View {
    var item: WishlistItem
    var hourlyRate: Double
    
    var hours: Double {
        guard hourlyRate > 0 else { return 0 }
        return (item.price / hourlyRate)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                
                // Hero
                ItemHeroCard(
                    name: item.name,
                    category: "Electronics",    // nanti bisa jadi property di WishlistItem
                    imageData: item.imageData,
                    placeholderColor: item.placeholderColor,
                    initial: item.initial
                )
                
                // Harga
                PriceInfoSection(
                    price: item.price,
                    hourlyRate: hourlyRate
                )
                
                // Jam
                HoursImpactCard(hours: hours)
                
                // Worth it?
                WorthItCard(hours: hours) {
                    // Yes — bisa navigate ke history / mark as bought
                } onPass: {
                    // No — bisa hapus dari wishlist
                }
                
                // Financial Context
                VStack(alignment: .leading, spacing: 16) {
                    Text("Financial Context")
                        .font(.title3)
                        .fontWeight(.black)
                    
                    Text("Based on your monthly savings goal of $800, this purchase would delay your \"Financial Freedom\" milestone by approximately 6 weeks.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    EquivalentCard(
                        prefix: "Equivalent to",
                        value: "\(ItemEquivalents.espressoDrinks(price: item.price)) Espresso Drinks"
                    )
                    
                    EquivalentCard(
                        prefix: "Or approximately",
                        value: "\(ItemEquivalents.gymMonths(price: item.price)) Months of Gym Membership"
                    )
                }
            }
            .padding(20)
        }
        .background(Color(.systemGray6).ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("WorthIt?")
                    .fontWeight(.bold)
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    // share
                } label: {
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }
    }
}

