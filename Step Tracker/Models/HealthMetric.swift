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
    
    static var mockData: [HealthMetric] {
        var array: [HealthMetric] = []
        
        for i in 0..<28 {
            let metric = HealthMetric(date: Calendar.current.date(byAdding: .day, value: -i, to: .now)!, value: .random(in: 4_000...10_000))
            array.append(metric)
        }
        
        return array
    }
}
