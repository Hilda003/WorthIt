//
//  DangerZoneCard.swift
//  WorthIt?
//
//  Created by hilda on 13/04/2026.
//

import SwiftUI

struct DangerZoneCard: View {
    var onDelete: () -> Void
    @State private var showConfirmation = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            VStack(alignment: .leading, spacing: 6) {
                Text("Delete Account")
                    .font(.headline)
                    .foregroundStyle(.red)
                
                Text("Permanently delete your account and all calculation history. This action cannot be undone.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            Button {
                showConfirmation = true
            } label: {
                Text("Delete My Data")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(Color.red)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
            }
        }
        .padding(20)
        .background(Color.red.opacity(0.08))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        // Konfirmasi sebelum delete — UX best practice
        .confirmationDialog(
            "Delete all data?",
            isPresented: $showConfirmation,
            titleVisibility: .visible
        ) {
            Button("Delete My Data", role: .destructive) {
                onDelete()
            }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("This action cannot be undone.")
        }
    }
}

#Preview {
    DangerZoneCard {}
        .padding()
}
