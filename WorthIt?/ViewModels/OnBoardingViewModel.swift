//
//  OnBoardingViewModel.swift
//  WorthIt?
//
//  Created by hilda on 07/04/2026.
//

import Foundation
import Combine


class OnBoardingViewModel : ObservableObject {
    @Published var inputValue: String = ""
    @Published var isMonthly: Bool = false

    
    
    func saveEarnings() {
        guard let value = Double(inputValue) else { return }
        let hourlyRate = isMonthly ? value / 160 : value
        UserDefaults.standard.set(hourlyRate, forKey: "hourlyRate")
        UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding")
    }
}

