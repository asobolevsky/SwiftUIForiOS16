//
//  ContentView.swift
//  DesignCodeiOS16
//
//  Created by Aleksei Sobolevskii on 2023-02-16.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @AppStorage("selectedMenu") private var selectedMenu: Menu = .compass
    @GestureState private var press = false

    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()

            switch selectedMenu {
            case .compass: Text("Compass")
            case .card: Text("card")
            case .charts: ChartView()
            case .radial: Text("radial")
            case .gooey: Text("gooey")
            case .actionbutton: Text("actionbutton")
            }
        }
        .gesture(longPress)
        .sheet(isPresented: $showMenu) {
            MenuView(selectedItem: $selectedMenu)
                .presentationDetents([.medium])
        }
    }

    private var longPress: some Gesture {
        LongPressGesture(minimumDuration: 1.0)
            .updating($press) { currentState, gestureState, transaction in
                gestureState = currentState
            }
            .onEnded { _ in
                showMenu = true
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
