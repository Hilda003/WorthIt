//
//  WorthIt_App.swift
//  WorthIt?
//
//  Created by hilda on 07/04/2026.
//

import SwiftUI
import SwiftData

@main
struct WorthIt_App: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    @AppStorage("hourlyRate") private var hourlyRate: Double = 0
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding: Bool = false

    var body: some Scene {
        WindowGroup {
            if hasCompletedOnboarding {
                HomeView(hourlyRate: hourlyRate)
                .environment(\.locale, Locale(identifier: "id_ID"))
            } else {
                OnBoardingView()
            }
        }
    }
   
    
}
