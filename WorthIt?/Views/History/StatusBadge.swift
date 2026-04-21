//
//  StatusBadge.swift
//  WorthIt?
//
//  Created by hilda on 14/04/2026.
//

import SwiftUI

struct StatusBadge: View {
    var status: ItemStatus

    var label: String {
        switch status {
        case .purchased: return "PURCHASED"
        case .passed: return "PASSED"
        case .wishlist: return ""
        }
    }

    var color: Color {
        switch status {
        case .purchased: return .green
        case .passed: return .red
        case .wishlist: return .clear
        }
    }

    var body: some View {
        Text(label)
            .font(.caption)
            .fontWeight(.bold)
            .foregroundStyle(color)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(color.opacity(0.12))
            .clipShape(Capsule())
    }
}

#Preview {
    HStack {
        StatusBadge(status: .purchased)
        StatusBadge(status: .passed)
    }
    .padding()
}
