//
//  EndView.swift
//  Multi-Wiz
//
//  Created by Andrea Bottino on 27/01/2024.
//

import SwiftUI

struct EndView: View {
    
    @Binding var path: [QuizNavigation]
    @Binding var data: QuizData
    
    var stat: StatModel {
        loadStats() ?? StatModel(baseNumber: data.baseNumber, totGames: 0, mistakePercentage: 0)
        
    }
    
    var body: some View {
        VStack(spacing: 40) {
            VStack {
                Spacer()
                Text("GAME OVER")
                    .font(.largeTitle)
                
                Text("Final Score: \(data.correctAnswersCount)/\(data.numberOfQuestions)")
            }
            VStack(spacing: 30) {
                Spacer()
                
                Button("Try Again") {
                    data.allQuestions = GameLogic.createQuiz(data.baseNumber, data.numberOfQuestions)
                    data.questionIndex = 0
                    data.correctAnswersCount = 0
                    path.removeLast()
                }
                .stylePrimaryButton()
                
                Button("Back to Setup") {
                    path.removeLast(2)
                }
                .styleSecondaryButton()
                
                Spacer()
            }
        }
        .onAppear(perform: {
            print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
        })
        .onDisappear(perform: saveStats)
        .navigationBarBackButtonHidden()
    }
    
    func saveStats() {
        let percentage = Double(100 * (data.numberOfQuestions - data.correctAnswersCount) / data.numberOfQuestions)
        let newStat = StatModel(baseNumber: data.baseNumber, totGames: stat.totGames + 1, mistakePercentage: (stat.mistakePercentage + percentage) / Double(stat.totGames + 1))
        
        if let statData = try? JSONEncoder().encode(newStat) {
            UserDefaults.standard.set(statData, forKey: "table of \(data.baseNumber)")
        }
    }
    
    func loadStats() -> StatModel?  {
        if let savedData = UserDefaults.standard.object(forKey: "table of \(data.baseNumber)") as? Data,
           let stat = try? JSONDecoder().decode(StatModel.self, from: savedData) {
            return stat
        } else {
            return nil
        }
    }
}

#Preview {
    EndView(path: PreviewsData.path, data: PreviewsData.data)
}

