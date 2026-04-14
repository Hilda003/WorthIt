//
//  CurrencyFormater.swift
//  WorthIt?
//
//  Created by hilda on 14/04/2026.
//

import Foundation

struct CurrencyFormatter {
    static let shared = CurrencyFormatter()
    
    private let formatter: NumberFormatter
    
    init(locale: Locale = Locale(identifier: "id_ID")) {  
           formatter = NumberFormatter()
           formatter.numberStyle = .currency
           formatter.locale = locale
       }
    
    func format(_ value: Double) -> String {
        formatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }
    
    var currencySymbol: String {
        formatter.currencySymbol ?? "$"
    }
    
    var usesDecimals: Bool {
        formatter.maximumFractionDigits > 0
    }
}
