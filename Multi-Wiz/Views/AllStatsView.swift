//
//  AllStatsView.swift
//  Multi-Wiz
//
//  Created by Andrea Bottino on 10/02/2024.
//

import SwiftUI

struct AllStatsView: View {
    
    var allStats: [StatModel] {
        var statsArray = [StatModel]()
        for i in 2..<10 {
            if let savedData = UserDefaults.standard.object(forKey: "table of \(i)") as? Data,
               let stat = try? JSONDecoder().decode(StatModel.self, from: savedData) {
                statsArray.append(stat)
            }
        }
        return statsArray
    }
    
    var body: some View {
        List {
            ForEach(allStats, id: \.baseNumber) { stat in
                StatsViewComponent(stat: stat)
            }
            .listRowSeparator(.hidden)
        }
        
        .listStyle(.plain)
        .navigationTitle("My Stats")
    }
}

#Preview {
    AllStatsView()
}

