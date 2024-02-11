//
//  QuizView.swift
//  Multi-Wiz
//
//  Created by Andrea Bottino on 27/01/2024.
//

import SwiftUI

struct QuizView: View {
    
    @State var baseNumber: Int
    @State var numberOfQuestions: Int
    @State private var allQuestions = [QuestionModel]() {
        didSet {
            gameIsReady = true
        }
    }
    @State private var gameIsReady = false
    @State private var userAnswer = ""
    @State private var questionIndex = 0
    
    @FocusState private var txtFieldFocused: Bool
    @State private var result: FeedbackEnum = .neutral
    @State private var correctAnswersCount = 0
    
    @State private var gameOver = false
    
    var body: some View {
        ZStack {
            Color(.myPurple)
                .ignoresSafeArea()
            
            if !gameOver {
                if gameIsReady {
                    VStack {
                        ProgressView("Question \(questionIndex + 1)/\(numberOfQuestions)", value: Double(questionIndex + 1), total: Double(numberOfQuestions))
                            .padding()
                        
                        Form {
                            VStack {
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
                                    .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width).fill(GameLogic.feedbackColor(result)))
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
                        .scrollContentBackground(.hidden)
                    }
                }
            } else {
                EndView(baseNumber: $baseNumber, allQuestions: $allQuestions, questionIndex: $questionIndex, numberOfQuestions: $numberOfQuestions, gameOver: $gameOver, txtFieldFocused: _txtFieldFocused, correctAnswersCount: $correctAnswersCount)
            }
        }
        .navigationTitle("Quiz")
        .onAppear {
            txtFieldFocused = true
            allQuestions = GameLogic.createQuiz(baseNumber, numberOfQuestions)
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
                txtFieldFocused = false
                gameOver = true
            }
            userAnswer = ""
            result = .neutral
        }
    }
}

#Preview {
    QuizView(baseNumber: 2, numberOfQuestions: 5)
}
