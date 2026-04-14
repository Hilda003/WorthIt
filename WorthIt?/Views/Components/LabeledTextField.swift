//
//  LabeledTextField.swift
//  WorthIt?
//
//  Created by hilda on 13/04/2026.
//


import SwiftUI

struct LabeledTextField: View {
    @Binding var value: String
    var label: String
    var placeholder: String
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(label)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
                .tracking(1.2)
            
            TextField(placeholder, text: $value)
                .padding(16)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .focused($isFocused)
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") { isFocused = false }
            }
        }
    }
}

#Preview {
    @Previewable @State var value: String = ""
    
    LabeledTextField(
        value: $value,
        label: "ITEM NAME",
        placeholder: "What are you eyeing?"
    )
    .padding()
}
