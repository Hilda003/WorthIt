//
//  EarningsInputField.swift
//  WorthIt?
//
//  Created by hilda on 07/04/2026.
//

import SwiftUI

struct EarningsInputField: View {
    @Binding var value: String
    var label: String = "YOUR EARNINGS"

    @FocusState private var isFocused: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(label)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
                .tracking(1.2)

            HStack {
                Text("Rp")
                    .font(.system(size: 36, weight: .regular))
                    .foregroundStyle(value.isEmpty ? .secondary : .primary)

                TextField("0", text: Binding(
                    get: {
                        
                        formatDisplay(value)
                    },
                    set: { new in
                       
                        value = new.filter { $0.isNumber }
                    }
                ))
                .font(.system(size: 36, weight: .regular))
                .foregroundStyle(value.isEmpty ? .secondary : .primary)
                .keyboardType(.numberPad)
                .focused($isFocused)
            }
            .padding(20)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 14))
        }
    }

    private func formatDisplay(_ input: String) -> String {
        guard !input.isEmpty, let number = Int(input) else { return input }

        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "id_ID")
        formatter.maximumFractionDigits = 0

        return formatter.string(from: NSNumber(value: number)) ?? input
    }
}
