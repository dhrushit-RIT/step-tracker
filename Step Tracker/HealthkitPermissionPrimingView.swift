//
//  HealthkitPermissionPrimingView.swift
//  Step Tracker
//
//  Created by Dhrushit Suresh Raval on 8/5/24.
//

import SwiftUI

struct HealthkitPermissionPrimingView: View {
    
    var description = """
    This app displays your step and weight data in interacive charts.

    You can also add new or weight data to Apple Health from this app. Your data is private and secured.
    """
    var body: some View {
        VStack(spacing: 130) {
            VStack(alignment: .leading, spacing: 12) {
                Image(.appleHealth)
                    .resizable()
                    .frame(width: 90, height: 90)
                    .shadow(color: .gray.opacity(0.3), radius: 16)
                    .padding(.bottom, 12)
                
                Text("Apple Health integration")
                    .font(.title2).bold()
                
                Text(description)
                    .foregroundStyle(.secondary)
            }
            
            Button("Connect Apple Health") {
                
            }
                .buttonStyle(.borderedProminent)
                .tint(.pink)
        }
        .padding(30)
    }
}

#Preview {
    HealthkitPermissionPrimingView()
}
