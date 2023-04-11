//
//  GridView.swift
//  DesignCodeiOS16
//
//  Created by Aleksei Sobolevskii on 2023-04-10.
//

import SwiftUI

struct GridView: View {
    var body: some View {
        Grid(alignment: .leading, horizontalSpacing: 12, verticalSpacing: 12) {
            GridRow {
                Text("Votes")
                    .gridColumnAlignment(.trailing)
                    .gridCellColumns(2)
                Text("Rating")
                    .gridColumnAlignment(.trailing)
            }
            .font(.footnote)
            .foregroundStyle(.secondary)
            Divider()
                .gridCellUnsizedAxes(.horizontal)
            GridRow {
                Text("4")
                ProgressView(value: 0.1)
                    .frame(maxWidth: 250)
                RatingView(rating: 1)
            }
            GridRow {
                Text("21")
                ProgressView(value: 0.2)
                    .frame(maxWidth: 250)
                RatingView(rating: 3)
            }
            GridRow {
                Text("37")
                ProgressView(value: 0.4)
                    .frame(maxWidth: 250)
                RatingView(rating: 5)
            }
        }
        .padding(20)
    }
}

struct RatingView: View {
    let rating: Int

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<5) { i in
                Image(systemName: i < rating ? "star.fill" : "star")
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
