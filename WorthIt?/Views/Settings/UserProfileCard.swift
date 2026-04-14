//
//  UserProfileCrad.swift
//  WorthIt?
//
//  Created by hilda on 13/04/2026.
//

import SwiftUI

struct UserProfileCard: View {
    var name: String
    var email: String
    var plan: String = "PRO PLAN"
    
    var body: some View {
        HStack(spacing: 16) {
            
            // Avatar
            Image(systemName: "person.fill")
                .font(.title2)
                .foregroundStyle(.blue)
                .frame(width: 56, height: 56)
                .background(Color.blue.opacity(0.15))
                .clipShape(RoundedRectangle(cornerRadius: 14))
            
            // Nama + email
            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.headline)
                Text(email)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            // Plan badge
            Text(plan)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(.blue)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 10)
                .padding(.vertical, 8)
                .background(Color.blue.opacity(0.12))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.04), radius: 6, y: 3)
    }
}

#Preview {
    UserProfileCard(name: "Alex Harrison", email: "alex.h@design.com")
        .padding()
}
