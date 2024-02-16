//
//  StatsView.swift
//  Multi-Wiz
//
//  Created by Andrea Bottino on 10/02/2024.
//

import SwiftUI

struct StatsView: View {
    
    let stat: StatModel
    
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Text("x \(stat.baseNumber)")
                    .foregroundStyle(.primary)
                    .containerRelativeFrame(.vertical) { size, axis  in
                        size * 0.5
                    }
                    .frame(maxWidth: .infinity)
                    .background(.background)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack(alignment: .leading) {
                    Text("Games Played: \(stat.totGames)")
                    Text("Average Mistakes %: \(String(format: "%.1f", stat.mistakePercentage))")
                }
                .foregroundStyle(.background)
                .containerRelativeFrame(.horizontal) { size, axis  in
                    size * 0.6
                }
            }
            .padding(.horizontal)
            
            Capsule()
                .frame(height: 5)
                .foregroundStyle(colorRating())
        }
        .padding(.top)
        .background(.myPurple)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
    
    func colorRating() -> Color {
        if (0.00...5.00).contains(stat.mistakePercentage) {
            return .green
        } else if (5.01...20.00).contains(stat.mistakePercentage) {
            return .yellow
        } else if (20.01...60.00).contains(stat.mistakePercentage) {
            return .orange
        } else {
            return .red
        }
    }
}


#Preview {
    StatsView(stat: StatModel(baseNumber: 2, totGames: 3, mistakePercentage: 100))
}
