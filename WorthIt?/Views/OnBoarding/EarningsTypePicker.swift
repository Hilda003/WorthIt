//
//  EarningsTypePicker.swift
//  WorthIt?
//
//  Created by hilda on 08/04/2026.
//


import SwiftUI



struct EarningsTypePicker : View {
    var body: some View {
        HStack(spacing: 10) {
            Button("Hourly") {
                
            }
                
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
            
            Spacer()
            Button("Monthly") {
                
                
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 40)
    }
}



#Preview {
    EarningsTypePicker()
}
