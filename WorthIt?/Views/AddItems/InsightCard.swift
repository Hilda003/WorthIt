//
//  InsightCard.swift
//  WorthIt?
//
//  Created by hilda on 13/04/2026.
//

import SwiftUI

struct InsightCard: View {
    var insight: String
    var imageData: Data? = nil      // opsional — kalau ada foto item
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            
            VStack(alignment: .leading, spacing: 8) {
                Text("INSIGHT")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(.blue)
                    .tracking(1.2)
                
                Text(insight)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundStyle(.primary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            Spacer()
            
            // Gambar item kalau ada, kalau nggak ada sembunyikan
            if let data = imageData, let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 90, height: 90)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
        .padding(20)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    InsightCard(insight: "Seeing your goal makes it 42% more likely to happen.")
        .padding()
}
