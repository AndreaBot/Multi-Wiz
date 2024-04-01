//
//  EndView-ViewModel.swift
//  Multi-Wiz
//
//  Created by Andrea Bottino on 29/03/2024.
//

import Foundation

extension EndView {
    
    @Observable
    final class ViewModel {
        
        var data: QuizData?
        var stat: StatModel {
            loadStats() ?? StatModel(baseNumber: data!.baseNumber, totGames: 0, mistakePercentage: 0)
        }
        
        func saveStats() {
            let percentage = Double(100 * (data!.numberOfQuestions - data!.correctAnswersCount) / data!.numberOfQuestions)
            let newStat = StatModel(baseNumber: data!.baseNumber, totGames: stat.totGames + 1, mistakePercentage: (stat.mistakePercentage + percentage) / Double(stat.totGames + 1))
            
            if let statData = try? JSONEncoder().encode(newStat) {
                UserDefaults.standard.set(statData, forKey: "table of \(data!.baseNumber)")
            }
        }
        
        func loadStats() -> StatModel?  {
            if let savedData = UserDefaults.standard.object(forKey: "table of \(data!.baseNumber)") as? Data,
               let stat = try? JSONDecoder().decode(StatModel.self, from: savedData) {
                return stat
            } else {
                return nil
            }
        }
        
        init(data: QuizData? = nil) {
            self.data = data
        }
    }
}
