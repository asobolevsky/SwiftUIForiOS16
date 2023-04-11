//
//  ChartView.swift
//  DesignCodeiOS16
//
//  Created by Aleksei Sobolevskii on 2023-04-06.
//

import Charts
import SwiftUI

struct ChartView: View {
    var body: some View {
        Chart {
            ForEach(chartValues) { value in
                BarMark(
                    x: .value("Day", value.day),
                    y: .value("Value", value.value)
                )
                    .cornerRadius(12)
                    .opacity(0.3)
                LineMark(
                    x: .value("Day", value.day),
                    y: .value("Value", value.value),
                    series: .value("Year", 2022)
                )
                    .cornerRadius(12)
                    .interpolationMethod(.catmullRom)
            }
        }
        .foregroundStyle(
            .linearGradient(colors: [.blue, .purple], startPoint: .top, endPoint: .bottom)
        )
        .frame(height: 300)
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
