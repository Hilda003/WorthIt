//
//  SettingsView.swift
//  WorthIt?
//
//  Created by hilda on 13/04/2026.
//

import SwiftUI

struct SettingsView: View {
    @State private var appearanceDark = false
    @State private var pushNotifications = true
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 28) {
                
                // Title
                Text("Settings")
                    .font(.system(size: 32, weight: .black))
                
                // Profile
                UserProfileCard(
                    name: "Alex Harrison",
                    email: "alex.h@design.com"
                )
                
                // Calculation Engine
                SettingsSection(title: "Calculation Engine") {
                    SettingsRow(
                        icon: "creditcard.fill",
                        iconColor: .blue,
                        label: "Default Currency"
                    ) {
                        HStack(spacing: 4) {
                            Text("USD ($)")
                                .foregroundStyle(.secondary)
                            Image(systemName: "chevron.right")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                    
                    Divider().padding(.leading, 62)
                    
                    SettingsRow(
                        icon: "percent",
                        iconColor: .orange,
                        label: "Local Tax Rate"
                    ) {
                        HStack(spacing: 4) {
                            Text("8.5%")
                                .foregroundStyle(.secondary)
                            Image(systemName: "chevron.right")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                
                // Preferences
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
                
                // Legal & Support
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
                
                // Danger Zone
                VStack(alignment: .leading, spacing: 10) {
                    Text("DANGER ZONE")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(.red)
                        .tracking(1.2)
                        .padding(.horizontal, 4)
                    
                    DangerZoneCard {
                        // handle delete
                    }
                }
                
                // Footer version
                Text("WORTHIT? VERSION 4.2.0 (BUILD 902)")
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
                Text("WORTHIT?")
                    .fontWeight(.black)
            }
            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "person.circle.fill")
                    .font(.title3)
                    .foregroundStyle(.blue)
            }
        }
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
