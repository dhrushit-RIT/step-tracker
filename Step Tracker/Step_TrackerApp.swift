//
//  Step_TrackerApp.swift
//  Step Tracker
//
//  Created by Dhrushit Suresh Raval on 8/5/24.
//

import SwiftUI

@main
struct Step_TrackerApp: App {
    let hkManager = HealthkitManager()
    var body: some Scene {
        WindowGroup {
            DashboardView()
                .environment(hkManager)
        }
    }
}
