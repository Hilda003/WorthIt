//
//  OnBoardingView.swift
//  WorthIt?
//
//  Created by hilda on 07/04/2026.
//

import SwiftUI

struct OnBoardingView: View {
    @StateObject private var onBoardingvm = OnBoardingViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            
            VStack(alignment: .leading, spacing: 24) {
                Text("Your Time is\nMoney")
                    .font(.system(size: 40, weight: .black))
                    .lineSpacing(4)
                
                Text("Input your earnings to see the true cost of what you buy in hours worked.")
                    .font(.body)
                    .foregroundStyle(.secondary)
            }
            
            EarningToggle(selected: $onBoardingvm.selectedMode)
            EarningsInputField(value: $onBoardingvm.earnings)
            
            FeatureInfoCard(
                icon: "chart.line.uptrend.xyaxis",
                title: "Curated Precision",
                description: "We account for taxes and hidden costs automatically"
            )
            
            Spacer()
            
            VStack(spacing: 16) {
                PrimaryButton(
                    title: "Continue",
                    action: onBoardingvm.saveEarnings,
                    isDisabled: !onBoardingvm.isInputValid
                )
                
                Text("WORTHIT? • VERSION 1.0.2")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                    .tracking(1)
            }
        }
        .padding(24)
        .background(Color(.systemGray6).ignoresSafeArea())
    }
}
