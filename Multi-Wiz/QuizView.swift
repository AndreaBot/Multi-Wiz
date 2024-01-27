//
//  QuizView.swift
//  Multi-Wiz
//
//  Created by Andrea Bottino on 27/01/2024.
//

import SwiftUI

struct QuizView: View {
    
    @Binding var allQuestions: [QuestionModel]
    @Binding var userAnswer: String
    @Binding var questionIndex: Int
    @Binding var numberOfQuestions: Int
    
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
    }
    
    func checkAnswer() {
        if userAnswer == allQuestions[questionIndex].correctAnswer {
            print("CORRECT!")
        } else {
            print("WRONG! The correct answer is \(allQuestions[questionIndex].correctAnswer)")
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if questionIndex + 1 <= numberOfQuestions - 1 {
                questionIndex += 1
                userAnswer = ""
            } else {
                print("GAME OVER")
            }
        }
    }
}
