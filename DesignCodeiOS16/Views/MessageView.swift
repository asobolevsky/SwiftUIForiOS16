//
//  MessageView.swift
//  DesignCodeiOS16
//
//  Created by Aleksei Sobolevskii on 2023-04-06.
//

import SwiftUI

struct MessageView: View {
    @State private var time = 0.0
    @State private var showMessage = true
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        messageView
            .opacity(showMessage ? 1 : 0)
            .scaleEffect(showMessage ? 1 : 0)
            .rotationEffect(.degrees(showMessage ? 0 : 30))
            .offset(y: showMessage ? 0 : 500)
            .blur(radius: showMessage ? 0 : 20)
            .padding()
            .dynamicTypeSize(.xSmall ... .xxxLarge)
    }

    private var messageView: some View {
        VStack(spacing: 20.0) {
            activityIndicator
            content
            actionButton
        }
        .padding(32)
        .background(.ultraThinMaterial)
        .cornerRadius(12)
        .overlay(borderOverlay)
        .shadow(color: .black.opacity(0.3), radius: 12, y: 20)
        .frame(maxWidth: 500)
    }

    private var activityIndicator: some View {
        Image(systemName: "timelapse", variableValue: time)
            .imageScale(.large)
            .foregroundColor(.accentColor)
            .font(.system(size: 50))
            .fontWeight(.thin)
            .onReceive(timer) { _ in
                if time < 1.0 {
                    time += 0.1
                } else {
                    time = 0.0
                }
            }
    }

    @ViewBuilder
    private var content: some View {
        Text("Switching Apps".uppercased())
            .font(.largeTitle.width(.condensed))
            .fontWeight(.bold)
        Text("Tap and hold any part of the screen for 1 second to show the menu for switching between apps.")
            .multilineTextAlignment(.center)
            .foregroundColor(.secondary)
            .fontWeight(.medium)
    }

    private var actionButton: some View {
        Button {
            withAnimation(.linear(duration: 0.3)) {
                showMessage = false
            }
        } label: {
            Text("Got it")
                .padding(.all)
                .frame(maxWidth: .infinity)
                .background(.white.opacity(0.2).gradient)
                .cornerRadius(12)
                .background(borderOverlay)
        }
        .accentColor(.primary)
        .shadow(radius: 12)
    }

    private var borderOverlay: some View {
        RoundedRectangle(cornerRadius: 12)
            .stroke()
            .foregroundStyle(
                .linearGradient(
                    colors: [.white.opacity(0.5), .clear, .white.opacity(0.5), .clear],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
            .background(Image("Wallpaper 2"))
    }
}
