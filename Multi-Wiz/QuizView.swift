//
//  QuizView.swift
//  Multi-Wiz
//
//  Created by Andrea Bottino on 27/01/2024.
//

import SwiftUI

struct QuizView: View {
    
    @Binding var baseNumber: Int
    @Binding var allQuestions: [QuestionModel]
    @Binding var userAnswer: String
    @Binding var questionIndex: Int
    @Binding var numberOfQuestions: Int
    @Binding var backHome: Bool
    @Binding var gameOn: Bool
    @FocusState var txtFieldFocused: Bool
    
    @State private var result: FeedbackEnum = .neutral
    @Binding var correctAnswersCount: Int
    
    var body: some View {
        
        if backHome {
            EndView(baseNumber: $baseNumber, allQuestions: $allQuestions, questionIndex: $questionIndex, numberOfQuestions: $numberOfQuestions, backHome: $backHome, gameOn: $gameOn, txtFieldFocused: _txtFieldFocused, correctAnswersCount: $correctAnswersCount)
        } else {
            ProgressView("Question \(questionIndex + 1)/\(numberOfQuestions)", value: Double(questionIndex + 1), total: Double(numberOfQuestions))
            
            Form {
                Section {
                    Text("What is")
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                    Text(allQuestions[questionIndex].question)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                Section {
                    TextField("Type your answer", text: $userAnswer)
                        .focused($txtFieldFocused)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(GameLogic.feedbackColor(result))
                        .clipShape(Capsule())
                }
                
                Section {
                    Button("Check Your Answer") {
                        checkAnswer()
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .scrollDisabled(true)
            .opacity(backHome ? 0 : 1)
            .onAppear {
                backHome = false
                txtFieldFocused = true
            }
        }
    }
    
    func checkAnswer() {
        guard userAnswer != "" else {
            print("you havent typed anything")
            return
        }
        
        if userAnswer == allQuestions[questionIndex].correctAnswer {
            result = .correct
            correctAnswersCount += 1
        } else {
            result = .wrong
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if questionIndex < numberOfQuestions - 1 {
                questionIndex += 1
            } else {
                backHome = true
                txtFieldFocused = false
            }
            userAnswer = ""
            result = .neutral
        }
    }
}
