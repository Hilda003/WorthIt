//
//  OnBoardingViewModel.swift
//  WorthIt?
//
//  Created by hilda on 07/04/2026.
//

import Foundation
import Combine
import SwiftUI

class OnBoardingViewModel: ObservableObject {
    @Published var earnings: String = ""
    @Published var selectedMode: EarningMode = .hourly
    @AppStorage("hourlyRate") private var hourlyRate: Double = 0
    @AppStorage("earningMode") private var savedMode: String = EarningMode.hourly.rawValue
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding: Bool = false
    
    var isInputValid: Bool {
        guard let value = Double(earnings) else { return false }
        return value > 0
    }
    
    func saveEarnings() {
        guard let value = Double(earnings), isInputValid else { return }
        
        hourlyRate = value  
        savedMode = selectedMode.rawValue
        hasCompletedOnboarding = true
    }}
