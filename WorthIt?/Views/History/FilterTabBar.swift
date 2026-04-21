//
//  FilterTabBar.swift
//  WorthIt?
//
//  Created by hilda on 14/04/2026.
//

import SwiftUI

enum HistoryFilter: String, CaseIterable {
    case all = "All"
    case purchased = "Purchased"
    case passed = "Passed"
}

struct FilterTabBar: View {
    @Binding var selected: HistoryFilter

    var body: some View {
        HStack(spacing: 10) {
            ForEach(HistoryFilter.allCases, id: \.self) { filter in
                Button {
                    selected = filter
                } label: {
                    Text(filter.rawValue)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 18)
                        .padding(.vertical, 10)
                        .background(selected == filter ? Color.blue : Color(.systemGray5))
                        .foregroundStyle(selected == filter ? .white : .primary)
                        .clipShape(Capsule())
                }
            }
            Spacer()
        }
    }
}

#Preview {
    @Previewable @State var filter: HistoryFilter = .all
    FilterTabBar(selected: $filter)
        .padding()
}
