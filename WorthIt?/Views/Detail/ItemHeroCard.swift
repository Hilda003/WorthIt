//
//  ItemHeroCard.swift
//  WorthIt?
//
//  Created by hilda on 13/04/2026.
//

import SwiftUI

struct ItemHeroCard: View {
    var name: String
    var category: String
    var imageData: Data?
    var placeholderColor: Color
    var initial: String
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            
            // Background — foto atau placeholder
            if let data = imageData, let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .frame(height: 220)
                    .clipped()
            } else {
                ZStack {
                    placeholderColor.opacity(0.2)
                    Text(initial)
                        .font(.system(size: 80, weight: .bold))
                        .foregroundStyle(placeholderColor.opacity(0.4))
                }
                .frame(maxWidth: .infinity)
                .frame(height: 220)
            }
            
            // Gradient overlay supaya teks kebaca
            LinearGradient(
                colors: [.clear, .black.opacity(0.7)],
                startPoint: .top,
                endPoint: .bottom
            )
            
            // Badge + nama
            VStack(alignment: .leading, spacing: 8) {
                Text(category.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Color.blue)
                    .clipShape(Capsule())
                
                Text(name)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.white)
            }
            .padding(16)
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    ItemHeroCard(
        name: "Flagship Phone Pro",
        category: "Electronics",
        imageData: nil,
        placeholderColor: .blue,
        initial: "F"
    )
    .padding()
}
