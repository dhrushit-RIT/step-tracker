//
//  HealthMetric.swift
//  Step Tracker
//
//  Created by Dhrushit Suresh Raval on 8/6/24.
//

import Foundation

struct HealthMetric: Identifiable {
    let id = UUID()
    let date: Date
    let value: Double
}
