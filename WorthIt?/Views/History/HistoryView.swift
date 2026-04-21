//
//  HistoryView.swift
//  WorthIt?
//
//  Created by hilda on 14/04/2026.
//

import SwiftUI

struct HistoryView: View {
    @Binding var items: [WishlistItem]
    var hourlyRate: Double
    var mode: String = "Hourly"

    @State private var filter: HistoryFilter = .all

    
    var historyItems: [WishlistItem] {
        let decided = items.filter { $0.status != .wishlist }
        switch filter {
        case .all: return decided
        case .purchased: return decided.filter { $0.status == .purchased }
        case .passed: return decided.filter { $0.status == .passed }
        }
    }

    
    var hoursSavedThisMonth: Int {
        let calendar = Calendar.current
        return items
            .filter {
                $0.status == .passed &&
                $0.decisionDate.map { calendar.isDate($0, equalTo: Date(), toGranularity: .month) } ?? false
            }
            .reduce(0) { $0 + $1.hoursNeeded(hourlyRate: hourlyRate, mode: mode) }
    }
    
    private func updateStatus(item: WishlistItem, to newStatus: ItemStatus) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].status = newStatus
        }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {

                    // Header
                    VStack(alignment: .leading, spacing: 8) {
                        Text("History")
                            .font(.system(size: 36, weight: .black))
                        Text("Your financial decisions over time")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }

                    HoursSavedCard(hoursSaved: hoursSavedThisMonth)

                    FilterTabBar(selected: $filter)

                    if historyItems.isEmpty {
                        emptyState
                    } else {
                        ForEach(historyItems) { item in
                            HistoryItemRow(item: item, hourlyRate: hourlyRate, mode: mode)
                                .contextMenu {
                                    Button {
                                        updateStatus(item: item, to: .purchased)
                                    } label: {
                                        Label("Mark as Purchased", systemImage: "checkmark")
                                    }

                                    Button(role: .destructive) {
                                        updateStatus(item: item, to: .passed)
                                    } label: {
                                        Label("Mark as Passed", systemImage: "xmark")
                                    }
                                }
                        }
                    }
                }
                .padding(20)
            }
            .background(Color(.systemGray6).ignoresSafeArea())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("WorthIt?").fontWeight(.bold)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "line.3.horizontal.decrease")
                        .font(.title3)
                }
            }
        }
    }

    var emptyState: some View {
        VStack(spacing: 16) {
            Image(systemName: "clock.arrow.circlepath")
                .font(.system(size: 48))
                .foregroundStyle(.secondary)

            Text("No decisions yet.")
                .font(.headline)

            Text("Start from your wishlist")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 60)
    }
}


