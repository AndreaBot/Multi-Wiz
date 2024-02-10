//
//  EndView.swift
//  Multi-Wiz
//
//  Created by Andrea Bottino on 27/01/2024.
//

import SwiftUI

struct EndView: View {
    
    @Binding var baseNumber: Int
    @Binding var allQuestions: [QuestionModel]
    @Binding var questionIndex: Int
    @Binding var numberOfQuestions: Int
    @Binding var gameOver: Bool
    @FocusState var txtFieldFocused: Bool
    
    @Binding var correctAnswersCount: Int
    
    var stat: StatModel {
        loadStats() ?? StatModel(baseNumber: baseNumber, totGames: 0, mistakePercentage: 0)
        
    }
    
    var body: some View {
        VStack(spacing: 40) {
            VStack {
                Spacer()
                Text("GAME OVER")
                    .font(.largeTitle)
                
                Text("Final Score: \(correctAnswersCount)/\(numberOfQuestions)")
            }
            VStack(spacing: 30) {
                Spacer()
                
                Button("Try Again") {
                    allQuestions = GameLogic.createQuiz(baseNumber, numberOfQuestions)
                    gameOver = false
                    questionIndex = 0
                    txtFieldFocused = true
                    correctAnswersCount = 0
                }
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderedProminent)
                
                Spacer()
            }
        }
        .onAppear(perform: {
            print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
        })
        .onDisappear(perform: saveStats)
    }
    
    func saveStats() {
        let percentage = Double(100 * (numberOfQuestions-correctAnswersCount) / numberOfQuestions)
        let newStat = StatModel(baseNumber: baseNumber, totGames: stat.totGames + 1, mistakePercentage: (stat.mistakePercentage + percentage) / Double(stat.totGames + 1))
        
        if let statData = try? JSONEncoder().encode(newStat) {
            UserDefaults.standard.set(statData, forKey: "table of \(baseNumber)")
        }
    }
    
    func loadStats() -> StatModel?  {
        if let savedData = UserDefaults.standard.object(forKey: "table of \(baseNumber)") as? Data,
           let stat = try? JSONDecoder().decode(StatModel.self, from: savedData) {
            return stat
        } else {
            return nil
        }
    }
}

