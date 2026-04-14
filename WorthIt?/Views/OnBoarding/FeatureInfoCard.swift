//
//  FeatureInfoCard.swift
//  WorthIt?
//
//  Created by hilda on 09/04/2026.
//


import SwiftUI

struct FeatureInfoCard: View {
    var icon: String
    var title: String
    var description: String
    var body: some View {
        
        HStack(alignment: .top, spacing: 16) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundStyle(.blue)
                .frame(width: 44, height: 44)
                .background(Color(.systemGray6))
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .fontWeight(.semibold)
                Text(description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
        }
        
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 12)
        
    }
}
