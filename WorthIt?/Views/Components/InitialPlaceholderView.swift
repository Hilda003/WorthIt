//
//  InitialPlaceholderView.swift
//  WorthIt?
//
//  Created by hilda on 13/04/2026.
//

import SwiftUI

struct InitialPlaceholderView: View {
    var initial: String
    var color: Color
    var size: CGFloat = 90
    
    var body: some View {
        ZStack {
            color.opacity(0.2)
            
            Text(initial)
                .font(.system(size: size * 0.4, weight: .bold))
                .foregroundStyle(color)
        }
        .frame(width: size, height: size)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    HStack(spacing: 12) {
        InitialPlaceholderView(initial: "i", color: .blue)
        InitialPlaceholderView(initial: "D", color: .green)
        InitialPlaceholderView(initial: "C", color: .orange)
    }
    .padding()
}
