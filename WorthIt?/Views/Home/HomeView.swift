//
//  HomeView.swift
//  WorthIt?
//
//  Created by hilda on 13/04/2026.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("hourlyRate") private var hourlyRate: Double = 0

    @State private var items: [WishlistItem] = [
        WishlistItem(name: "iPhone 15 Pro", price: 999),
        WishlistItem(name: "Designer Chair", price: 1250),
        WishlistItem(name: "Coffee Grinder", price: 299)
    ]
    @State private var showAddItem = false
    @AppStorage("earningMode") private var savedMode: String = EarningMode.hourly.rawValue 


    var body: some View {
        TabView {
            homeTab
                .tabItem { Label("Home", systemImage: "house.fill") }

            HistoryView(items: $items, hourlyRate: hourlyRate, mode: savedMode)
                .tabItem { Label("History", systemImage: "clock.arrow.circlepath") }

            NavigationStack {
                SettingsView()
            }
            .tabItem { Label("Settings", systemImage: "gearshape.fill") }
        }
        .tint(.blue)
    }
}

extension HomeView {

    var homeTab: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    headerSection
                    CurrentGoalCard(
                        goalName: items.first?.name ?? "-",
                        hoursRemaining: items.first?.hoursNeeded(hourlyRate: hourlyRate, mode: savedMode) ?? 0,
                        progress: 0.65
                    )
                    HourlyRateCard(hourlyRate: hourlyRate, mode: savedMode)
                    wishlistSection
                }
                .padding(20)
            }
            .background(Color(.systemGray6))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { homeToolbar }
            .sheet(isPresented: $showAddItem) {
                AddItemView { newItem in
                    items.append(newItem)
                }
            }
        }
    }

    var headerSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Rectangle()
                .fill(Color.blue)
                .frame(width: 40, height: 4)
                .clipShape(Capsule())

            Text("My Wishlist")
                .font(.system(size: 36, weight: .black))

            Text("Time is the ultimate currency. See what your labor buys.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }

    var wishlistSection: some View {
        ForEach($items.filter { $0.status.wrappedValue == .wishlist }) { $item in
            NavigationLink(destination: ItemDetailView(item: $item, hourlyRate: hourlyRate, mode: savedMode)) {
                WishlistItemRow(item: $item, hourlyRate: hourlyRate, mode: savedMode)
            }
            .buttonStyle(.plain)
        }
    }

    @ToolbarContentBuilder
    var homeToolbar: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Text("WorthIt?").fontWeight(.bold)
        }
        ToolbarItem(placement: .topBarLeading) {
            Image(systemName: "person.circle").font(.title3)
        }
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                showAddItem = true
            } label: {
                Image(systemName: "plus")
                    .font(.title3)
                    .fontWeight(.semibold)
            }
        }
   
        ToolbarItem(placement: .topBarLeading) {
            Button("Reset") {
                UserDefaults.standard.removeObject(forKey: "hasCompletedOnboarding")
                UserDefaults.standard.removeObject(forKey: "hourlyRate")
            }
        }
    }
}

#Preview {
    HomeView()
}
