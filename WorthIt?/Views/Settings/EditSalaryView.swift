//
//  EditSalaryView.swift
//  WorthIt?
//
//  Created by hilda on 21/04/2026.
//

import SwiftUI

struct EditSalaryView: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage("hourlyRate") private var hourlyRate: Double = 0
    @State private var input: String = ""

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 24) {
                EarningsInputField(value: $input)
                PrimaryButton(title: "Simpan") {
                    hourlyRate = Double(input) ?? hourlyRate
                    dismiss()
                }
                Spacer()
            }
            .padding(24)
            .navigationTitle("Edit Salary")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Batal") { dismiss() }
                }
            }
        }
        .onAppear {
            input = String(Int(hourlyRate))
        }
    }
}
