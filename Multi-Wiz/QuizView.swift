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
    
    var body: some View {
        Form {
            Section {
                Text("What is")
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                Text(allQuestions[questionIndex].question)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
            }
            Section {
                TextField("Type your answer", text: $userAnswer)
                    .focused($txtFieldFocused)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
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
        
        if backHome {
            VStack(spacing: 40) {
                Text("GAME OVER")
                    .font(.largeTitle)
                    .frame(height: UIScreen.main.bounds.size.height * 0.4)
                
                Button("Try Again") {
                    allQuestions = GameLogic.createQuiz(baseNumber, numberOfQuestions)
                    backHome = false
                    questionIndex = 0
                }
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderedProminent)
                
                Button("Go Back") {
                    questionIndex = 0
                    gameOn = false
                }
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderedProminent)
                
                Spacer()
            }
        }
    }
    
    
    func checkAnswer() {
        guard userAnswer != "" else {
            print("you havent typed anything")
            return
        }
        
        if userAnswer == allQuestions[questionIndex].correctAnswer {
            print("CORRECT!")
        } else {
            print("WRONG! The correct answer is \(allQuestions[questionIndex].correctAnswer)")
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if questionIndex < numberOfQuestions - 1 {
                questionIndex += 1
            } else {
                backHome = true
                txtFieldFocused = false
            }
            userAnswer = ""
        }
    }
}
