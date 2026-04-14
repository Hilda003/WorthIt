//
//  WorthItCard.swift
//  WorthIt?
//
//  Created by hilda on 13/04/2026.
//

import SwiftUI

struct WorthItCard: View {
    var hours: Double
    var onConfirm: () -> Void
    var onPass: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            
            VStack(spacing: 12) {
                Text("Is it worth the\neffort?")
                    .font(.title2)
                    .fontWeight(.black)
                    .multilineTextAlignment(.center)
                
                Text("Think about the \(Int(hours)) hours of focused work, the energy spent, and the other ways you could invest that time or capital.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
            
            VStack(spacing: 12) {
                // Yes button — reuse PrimaryButton
                PrimaryButton(title: "Yes, it is", action: onConfirm)
                
                // No button — secondary style
                Button(action: onPass) {
                    Text("No, I'll pass")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 18)
                        .background(Color(.systemGray6))
                        .foregroundStyle(.primary)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
        }
        .padding(20)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }
}


