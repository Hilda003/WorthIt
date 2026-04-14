//
//  HoursImpactCard.swift
//  WorthIt?
//
//  Created by hilda on 13/04/2026.
//

import SwiftUI

struct HoursImpactCard: View {
    var hours: Double
    
    // Hitung berapa hari kerja (asumsi 8 jam/hari)
    var workDays: Int {
        Int((hours / 8).rounded(.up))
    }
    
    private func buildDescription() -> AttributedString {
        var result = AttributedString("That's nearly ")
        
        var highlight = AttributedString("\(workDays) full work days")
        highlight.font = .subheadline.bold()
        highlight.foregroundColor = .blue
        
        let end = AttributedString(" of your life dedicated solely to this purchase.")
        
        result += highlight
        result += end
        
        return result
    }
    
    var body: some View {
        ZStack {
            // Watermark angka di belakang
            Text("\(Int(hours))")
                .font(.system(size: 120, weight: .black))
                .foregroundStyle(Color(.systemGray5))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, -10)
            
            VStack(alignment: .leading, spacing: 12) {
                // Angka jam besar
                HStack(alignment: .lastTextBaseline, spacing: 4) {
                    Text(String(format: "%.1f", hours))
                        .font(.system(size: 56, weight: .black))
                    
                    Text("HOURS")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.secondary)
                        .padding(.bottom, 4)
                }
                
                // Deskripsi
                Group {
                    Text(buildDescription())
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(20)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }
}

#Preview {
    HoursImpactCard(hours: 26.6)
        .padding()
}
