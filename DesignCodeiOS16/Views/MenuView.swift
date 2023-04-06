//
//  MenuView.swift
//  DesignCodeiOS16
//
//  Created by Aleksei Sobolevskii on 2023-04-06.
//

import SwiftUI

struct MenuView: View {
    @Binding var selectedItem: Menu

    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        List(navigationItems) { item in
            Button {
                selectedItem = item.menu
                presentationMode.wrappedValue.dismiss()
            } label: {
                Label(item.title, systemImage: item.icon)
                    .foregroundColor(.primary)
                    .padding(8)
            }
        }
        .listStyle(.plain)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(selectedItem: .constant(.card))
    }
}
