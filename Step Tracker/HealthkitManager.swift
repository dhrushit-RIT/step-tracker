//
//  HealthkitManager.swift
//  Step Tracker
//
//  Created by Dhrushit Suresh Raval on 8/5/24.
//

import Foundation
import HealthKit
import Observation

@Observable class HealthkitManager {
    let store = HKHealthStore()
    
    let types: Set = [HKQuantityType(.stepCount), HKQuantityType(.bodyMass)]
}
