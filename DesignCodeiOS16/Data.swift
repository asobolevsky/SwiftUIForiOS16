//
//  Data.swift
//  DesignCodeiOS16
//
//  Created by Aleksei Sobolevskii on 2023-04-06.
//

import Foundation

struct NavigationItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let icon: String
    let menu: Menu
}

var navigationItems = [
    NavigationItem(title: "Compass App", icon: "safari", menu: .compass),
    NavigationItem(title: "3D Card", icon: "lanyardcard", menu: .card),
    NavigationItem(title: "Radial Layout", icon: "clock", menu: .radial),
    NavigationItem(title: "Gooey Action Button", icon: "plus.circle", menu: .actionbutton),
    NavigationItem(title: "Gooey Menu", icon: "drop", menu: .gooey),
    NavigationItem(title: "Charts", icon: "chart.xyaxis.line", menu: .charts),
]

enum Menu: String {
    case compass
    case card
    case charts
    case radial
    case gooey
    case actionbutton
}

struct ChartValue: Identifiable {
    let id = UUID()
    let day: String
    let value: Double
}

let chartValues = [
    ChartValue(day: "June 1", value: 200),
    ChartValue(day: "June 2", value: 180),
    ChartValue(day: "June 3", value: 220),
    ChartValue(day: "June 4", value: 115),
    ChartValue(day: "June 5", value: 280),
]
