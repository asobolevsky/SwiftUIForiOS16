//
//  NavigationStackView.swift
//  DesignCodeiOS16
//
//  Created by Aleksei Sobolevskii on 2023-04-06.
//

import SwiftUI

struct NavigationStackView: View {
    var body: some View {
        NavigationStack {
            List(navigationItems) { item in
                NavigationLink(value: item) {
                    Label(item.title, systemImage: item.icon)
                        .foregroundColor(.primary)
                }
            }
            .navigationDestination(for: NavigationItem.self) { item in
                switch item.menu {
                case .compass: Text(item.title)
                case .card: Text(item.title)
                case .charts: Text(item.title)
                case .radial: Text(item.title)
                case .gooey: Text(item.title)
                case .actionbutton: Text(item.title)
                }
            }
            .navigationTitle("SwiftUI Apps")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.plain)
        }
    }
}

struct NavigationStackView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackView()
    }
}
