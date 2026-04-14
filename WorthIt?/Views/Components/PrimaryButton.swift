//
//  PrimaryButton.swift
//  WorthIt?
//
//  Created by hilda on 07/04/2026.
//

import SwiftUI

struct PrimaryButton: View {
    var title: String
    var action: () -> Void
    var isDisabled: Bool = false
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 18)
                .background(isDisabled ? Color.blueDark.opacity(0.4) : Color.blueDark)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .disabled(isDisabled)
    }
        
}


#Preview {
    PrimaryButton(title: "Hourly", action: {
        
    }, isDisabled: false)
}
