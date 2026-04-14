//
//  EarningToggle.swift
//  WorthIt?
//
//  Created by hilda on 09/04/2026.
//



import SwiftUI

enum EarningMode: String, CaseIterable {
    case hourly = "Hourly"
    case monthly = "Monthly"
    
}

struct EarningToggle: View {
    @Binding var selected: EarningMode
    var body: some View {
        HStack(spacing: 0) {
            ForEach(EarningMode.allCases, id: \.self) { mode in
                Button {
                    selected = mode
                } label: {
                    Text(mode.rawValue)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 20)
                        .background(selected == mode ? Color.blueDark : Color(.systemGray6))
                        .foregroundStyle(selected == mode ? .white : .primary)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }
            }
        }
    }
}
