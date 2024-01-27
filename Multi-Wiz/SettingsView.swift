//
//  SettingsView.swift
//  Multi-Wiz
//
//  Created by Andrea Bottino on 27/01/2024.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var baseNumber: Int
    @Binding var numberOfQuestions: Int
    @Binding var allQuestions: [QuestionModel]
    @Binding var gameOn: Bool
    
    var body: some View {
        Form {
            Section {
                Picker("I want to practice the multiplication table of:", selection: $baseNumber) {
                    ForEach(0..<10) { number in
                        if number != 0 && number != 1 {
                            Text("\(number)")
                        }
                    }
                }
            }
            
            Section {
                Stepper("Number of questions:  \(numberOfQuestions)", value: $numberOfQuestions, in: 5...20)
            }
            
            HStack {
                Spacer()
                Button("START") {
                    gameOn = true
                    startGame(tableOf: baseNumber, numberOfQuestions)
                }
                Spacer()
            }
        }
        .opacity(gameOn ? 0 : 1)
        .scrollDisabled(true)
    }
    
    func startGame(tableOf num: Int, _ nOfQuestions: Int) {
        allQuestions = GameLogic.createQuiz(num, nOfQuestions)
        gameOn = true
    }
}
