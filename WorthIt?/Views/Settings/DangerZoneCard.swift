//
//  DangerZoneCard.swift
//  WorthIt?
//
//  Created by hilda on 13/04/2026.
//

import SwiftUI

struct DangerZoneCard: View {
    var onClearHistory: () -> Void
    var onDeleteAll: () -> Void

    @State private var showClearConfirmation = false
    @State private var showDeleteConfirmation = false

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: 6) {
                Text("Clear History")
                    .font(.headline)
                    .foregroundStyle(.orange)

                Text("Remove all past decisions. Your wishlist and profile stay intact.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                Button {
                    showClearConfirmation = true
                } label: {
                    Text("Clear History")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(Color.orange)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }
            }

            Divider()
            VStack(alignment: .leading, spacing: 6) {
                Text("Delete My Data")
                    .font(.headline)
                    .foregroundStyle(.red)

                Text("Permanently delete everything and reset the app. This cannot be undone.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                Button {
                    showDeleteConfirmation = true
                } label: {
                    Text("Delete My Data")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(Color.red)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }
            }
        }
        .padding(20)
        .background(Color.red.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 16))
 
        .confirmationDialog(
            "Clear all history?",
            isPresented: $showClearConfirmation,
            titleVisibility: .visible
        ) {
            Button("Clear History", role: .destructive) { onClearHistory() }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Your wishlist and profile will not be affected.")
        }
        .confirmationDialog(
            "Delete everything?",
            isPresented: $showDeleteConfirmation,
            titleVisibility: .visible
        ) {
            Button("Delete My Data", role: .destructive) { onDeleteAll() }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("This will reset the app completely. This action cannot be undone.")
        }
    }
}

#Preview {
    DangerZoneCard {} onDeleteAll: {}
        .padding()
}
