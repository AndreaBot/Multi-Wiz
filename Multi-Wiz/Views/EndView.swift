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
    }
}
