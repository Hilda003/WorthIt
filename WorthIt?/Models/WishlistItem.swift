import Foundation
import SwiftData
import SwiftUI

@Model
class WishlistItem {
    var name: String
    var price: Double
    var imageData: Data?
    var decisionDate: Date?
    private var statusRaw: String = ItemStatus.wishlist.rawValue  

    var status: ItemStatus {
        get { ItemStatus(rawValue: statusRaw) ?? .wishlist }
        set { statusRaw = newValue.rawValue }
    }

    init(name: String, price: Double, imageData: Data? = nil, status: ItemStatus = .wishlist, decisionDate: Date? = nil) {
        self.name = name
        self.price = price
        self.imageData = imageData
        self.statusRaw = status.rawValue
        self.decisionDate = decisionDate
    }

    var initial: String {
        String(name.prefix(1)).uppercased()
    }

    var placeholderColor: Color {
        let colors: [Color] = [.blue, .green, .orange, .purple, .red, .teal, .indigo]
        let index = abs(name.hashValue) % colors.count
        return colors[index]
    }

    func hoursNeeded(hourlyRate: Double, mode: String = "Hourly", isSalaryNet: Bool = true) -> Int {
        guard hourlyRate > 0 else { return 0 }
        let effectiveSalary = isSalaryNet ? hourlyRate : hourlyRate * 0.85
        let effectiveRate = mode == "Monthly" ? effectiveSalary / 160 : effectiveSalary
        return Int((price / effectiveRate).rounded(.up))
    }
}
