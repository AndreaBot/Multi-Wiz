//
//  QuizView.swift
//  Multi-Wiz
//
//  Created by Andrea Bottino on 27/01/2024.
//

import SwiftUI

struct QuizView: View {
    
    @Binding var path: [QuizNavigation]
    @Binding var data: QuizData

    @State private var gameIsReady = false
    @State private var userAnswer = ""
    @State private var result: FeedbackEnum = .neutral
    
    @FocusState private var txtFieldFocused: Bool
    
    
    var body: some View {
        ZStack {
            Color(.myPurple)
                .ignoresSafeArea()

            if data.allQuestions.count > 0 {
                    VStack {
                        ProgressView("Question \(data.questionIndex + 1)/\(data.numberOfQuestions)", value: Double(data.questionIndex + 1), total: Double(data.numberOfQuestions))
                            .padding()
                        
                        Form {
                            VStack {
                                Text("What is")
                                    .multilineTextAlignment(.center)
                                    .frame(maxWidth: .infinity)
                                Text(data.allQuestions[data.questionIndex].question)
                                    .multilineTextAlignment(.center)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                            }
                            Section {
                                TextField("Type your answer", text: $userAnswer)
                                    .focused($txtFieldFocused)
                                    .keyboardType(.numberPad)
                                    .multilineTextAlignment(.center)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .background(Capsule().fill(GameLogic.feedbackColor(result)))
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
            }
        .navigationTitle("Quiz")
        .onAppear {
            txtFieldFocused = true
            data.allQuestions = GameLogic.createQuiz(data.baseNumber, data.numberOfQuestions)
        }
    }
    
    func checkAnswer() {
        guard userAnswer != "" else {
            print("you havent typed anything")
            return
        }
        
        if userAnswer == data.allQuestions[data.questionIndex].correctAnswer {
            result = .correct
            data.correctAnswersCount += 1
        } else {
            result = .wrong
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if data.questionIndex < data.numberOfQuestions - 1 {
                data.questionIndex += 1
            } else {
                txtFieldFocused = false
                path.append(.endView)

            }
            userAnswer = ""
            result = .neutral
        }
    }
}

#Preview {
    QuizView(path: PreviewsData.path, data: PreviewsData.data)
}
