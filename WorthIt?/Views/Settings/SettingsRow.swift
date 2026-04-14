//
//  SettingRow.swift
//  WorthIt?
//
//  Created by hilda on 13/04/2026.
//

import SwiftUI

struct SettingsRow<Trailing: View>: View {
    var icon: String
    var iconColor: Color
    var label: String
    @ViewBuilder var trailing: () -> Trailing
    
    var body: some View {
        HStack(spacing: 14) {
            
            // Icon
            Image(systemName: icon)
                .font(.subheadline)
                .foregroundStyle(iconColor)
                .frame(width: 32, height: 32)
                .background(iconColor.opacity(0.12))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Text(label)
                .font(.body)
            
            Spacer()
            
            trailing()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
    }
}
