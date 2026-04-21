//
//  SettingsView.swift
//  WorthIt?
//
//  Created by hilda on 13/04/2026.
//

import SwiftUI
import SwiftData

struct SettingsView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [WishlistItem]
    

    @AppStorage("isSalaryNet") private var isSalaryNet: Bool = true
    @AppStorage("hourlyRate") private var hourlyRate: Double = 0
    @AppStorage("earningMode") private var savedMode: String = EarningMode.hourly.rawValue
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding: Bool = true

    @State private var appearanceDark = false
    @State private var pushNotifications = true
    @State private var editedSalary: String = ""
    @State private var selectedMode: EarningMode = .hourly
    @State private var showEditSalary = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 28) {

                Text("Settings")
                    .font(.system(size: 32, weight: .black))

                UserProfileCard(
                    name: "Alex Harrison",
                    email: "alex.h@design.com"
                )

                // Calculation Engine
                SettingsSection(title: "Calculation Engine") {

                    // Edit salary
                    SettingsRow(
                        icon: "banknote.fill",
                        iconColor: .blue,
                        label: "Your Salary"
                    ) {
                        HStack(spacing: 4) {
                            Text(CurrencyFormatter.shared.format(hourlyRate))
                                .foregroundStyle(.secondary)
                                .lineLimit(1)
                                .minimumScaleFactor(0.7)
                            Image(systemName: "chevron.right")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .onTapGesture { showEditSalary = true }
                    Divider().padding(.leading, 62)

                    // Edit mode
                    SettingsRow(
                        icon: "calendar.badge.clock",
                        iconColor: .purple,
                        label: "Earning Mode"
                    ) {
                        Picker("", selection: $savedMode) {
                            ForEach(EarningMode.allCases, id: \.self) { mode in
                                Text(mode.rawValue).tag(mode.rawValue)
                            }
                        }
                        .pickerStyle(.menu)
                        .labelsHidden()
                    }

                    Divider().padding(.leading, 62)

                    SettingsRow(
                        icon: "percent",
                        iconColor: .orange,
                        label: "Gaji sudah nett?"
                    ) {
                        Toggle("", isOn: $isSalaryNet)
                            .labelsHidden()
                    }
                }

                SettingsSection(title: "Preferences") {
                    SettingsRow(
                        icon: "moon.fill",
                        iconColor: .indigo,
                        label: "Appearance"
                    ) {
                        Toggle("", isOn: $appearanceDark)
                            .labelsHidden()
                    }

                    Divider().padding(.leading, 62)

                    SettingsRow(
                        icon: "bell.badge.fill",
                        iconColor: .red,
                        label: "Push Notifications"
                    ) {
                        Toggle("", isOn: $pushNotifications)
                            .labelsHidden()
                    }
                }
                SettingsSection(title: "Legal & Support") {
                    SettingsRow(
                        icon: "questionmark.circle.fill",
                        iconColor: .gray,
                        label: "Help Center"
                    ) {
                        Image(systemName: "arrow.up.right.square")
                            .foregroundStyle(.secondary)
                    }

                    Divider().padding(.leading, 62)

                    SettingsRow(
                        icon: "shield.fill",
                        iconColor: .gray,
                        label: "Privacy Policy"
                    ) {
                        Image(systemName: "chevron.right")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }

                    Divider().padding(.leading, 62)

                    SettingsRow(
                        icon: "doc.text.fill",
                        iconColor: .gray,
                        label: "Terms of Service"
                    ) {
                        Image(systemName: "chevron.right")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
                VStack(alignment: .leading, spacing: 10) {
                    Text("DANGER ZONE")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(.red)
                        .tracking(1.2)
                        .padding(.horizontal, 4)

                    DangerZoneCard {
                        clearHistory()
                    } onDeleteAll: {
                        deleteAllData()
                    }
                }

                Text("WORTHIT? VERSION 1.0.0")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                    .tracking(1)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 8)
            }
            .padding(20)
        }
        .background(Color(.systemGray6).ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("WORTHIT?").fontWeight(.black)
            }
            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "person.circle.fill")
                    .font(.title3)
                    .foregroundStyle(.blue)
            }
        }
        .sheet(isPresented: $showEditSalary) {
            EditSalaryView()
        }
    }
    private func clearHistory() {
        let historyItems = items.filter { $0.status != .wishlist }
        for item in historyItems {
            modelContext.delete(item)
        }
    }

    private func deleteAllData() {
        for item in items {
            modelContext.delete(item)
        }
        UserDefaults.standard.removeObject(forKey: "hasCompletedOnboarding")
        UserDefaults.standard.removeObject(forKey: "hourlyRate")
        UserDefaults.standard.removeObject(forKey: "earningMode")
        UserDefaults.standard.removeObject(forKey: "isSalaryNet")
    }
}



#Preview {
    NavigationStack {
        SettingsView()
    }
}
