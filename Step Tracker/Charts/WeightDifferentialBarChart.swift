//
//  WeightDifferentialBarChart.swift
//  Step Tracker
//
//  Created by Dhrushit Raval on 8/17/24.
//

import SwiftUI
import Charts

struct WeightDifferentialBarChart: View {
    
    @State private var rawSelectedDate: Date?
    
    var selectedData: WeekdayChartData? {
        guard let rawSelectedDate else { return nil }
        return chartData.first {
            Calendar.current .isDate(rawSelectedDate, inSameDayAs: $0.date)
        }
    }
    var chartData: [WeekdayChartData]
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Label("Average Weight Change", systemImage: "figure")
                        .font(.title3.bold())
                        .foregroundStyle(.indigo)
                    Text("Per Weekday (Last 28 days)")
                        .foregroundStyle(.secondary)
                        .font(.caption)
                }
                
                Spacer()
            }
            .foregroundStyle(.secondary)
            .padding(.bottom, 12)
            
            
            Chart {
                if let selectedData {
                    RuleMark(x: .value("Selected Data", selectedData.date))
                        .foregroundStyle(Color.secondary.opacity(0.3))
                        .offset(y: -10)
                        .annotation(
                            position: .top,
                            spacing: 0,
                            overflowResolution: .init(
                                x: .fit(to: .chart), y: .disabled
                            )) {
                                annotationView
                            }
                    
                }
                
                ForEach(chartData) { weightDiff in
                    BarMark(
                        x: .value("Day", weightDiff.date, unit: .day),
//                        x: .value("Day", weightDiff.date.formatted(.dateTime .weekday(.abbreviated))),
                        y: .value("Differential", weightDiff.value)
                    )
                    .foregroundStyle(weightDiff.value >= 0 ? Color.indigo.gradient : Color.mint.gradient)
                }
            }
            .frame(height: 150)
            .chartXAxis {
                AxisMarks(values: .stride(by: .day)) {
                    AxisValueLabel(format: .dateTime.weekday( ), centered: true)
                }
            }
            .chartXSelection(value: $rawSelectedDate.animation(.easeInOut))
            .chartYAxis {
                AxisMarks {
                    AxisGridLine()
                        .foregroundStyle(.secondary.opacity(0.3))
                    AxisValueLabel()
                }
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12)
            .fill(Color(.secondarySystemBackground)))
    }
    
    var annotationView: some View {
        VStack(alignment: .leading) {
            Text(selectedData?.date ?? .now, format: .dateTime.weekday().month(.abbreviated).day())
                .font(.footnote.bold())
                .foregroundStyle(.secondary)
            Text(selectedData?.value ?? 0, format: .number.precision(.fractionLength(2)))
                .fontWeight(.heavy)
                .foregroundStyle((selectedData?.value ?? 0) >= 0 ? .indigo : .mint)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 4)
                .fill(Color(.secondarySystemBackground))
                .shadow(color: .secondary.opacity(0.3), radius: 2, x: 2, y: 2)
        )
    }
}

#Preview {
    WeightDifferentialBarChart(chartData: MockData.weightDiffs)
}
