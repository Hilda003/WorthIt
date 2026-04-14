//
//  AddItems.swift
//  WorthIt?
//
//  Created by hilda on 13/04/2026.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.dismiss) var dismiss
    
    // Data yang akan dibuat
    @State private var itemName: String = ""
    @State private var price: String = ""
    
    // Callback ke HomeView saat item ditambahkan
    var onAdd: (WishlistItem) -> Void
    
    var isFormValid: Bool {
        !itemName.isEmpty && !(Double(price) ?? 0 == 0)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 28) {
                    
                    // Header
                    VStack(alignment: .leading, spacing: 8) {
                        Text("New Goal")
                            .font(.system(size: 36, weight: .black))
                        
                        Text("Visualize your next investment.")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    
                    // Input nama
                    LabeledTextField(
                        value: $itemName,
                        label: "ITEM NAME",
                        placeholder: "What are you eyeing?"
                    )
                    
                    // Input harga — reuse EarningsInputField
                    EarningsInputField(value: $price, label: "PRICE")
                    
                    // Insight card
                    InsightCard(
                        insight: "Seeing your goal makes it 42% more likely to happen."
                    )
                    
                    Spacer(minLength: 20)
                    
                    // Tombol add
                    PrimaryButton(
                        title: "Add to Wishlist",
                        action: handleAdd,
                        isDisabled: !isFormValid
                    )
                    
                    // Footer note
                    Text("We'll calculate how many hours of work this costs based on your profile.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                }
                .padding(24)
            }
            .background(Color(.systemGray6).ignoresSafeArea())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("WorthIt?")
                        .fontWeight(.bold)
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.secondary)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        // more options
                    } label: {
                        Image(systemName: "ellipsis")
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
    }
    
    private func handleAdd() {
        let newItem = WishlistItem(
            name: itemName,
            price: Double(price) ?? 0
        )
        onAdd(newItem)
        dismiss()
    }
}

#Preview {
    AddItemView { item in
        print("Added: \(item.name)")
    }
}
