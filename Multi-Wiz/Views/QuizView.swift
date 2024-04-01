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
    
    @FocusState var txtFieldFocused: Bool
    
    
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
                            TextField("Type your answer", text: $data.userAnswer)
                                .focused($txtFieldFocused)
                                .keyboardType(.numberPad)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Capsule().fill(feedbackColor(data.result)))
                        }
                        
                        Section {
                            Button("Check Your Answer") {
                                data.checkAnswer()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    if self.data.questionIndex < self.data.numberOfQuestions - 1 {
                                        self.data.questionIndex += 1
                                    } else {
                                        self.txtFieldFocused = false
                                        self.path.append(.endView)
                                        
                                    }
                                    data.userAnswer = ""
                                    data.result = .neutral
                                }
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
            data.createQuiz()
        }
    }
    
    func feedbackColor(_ feedback: FeedbackEnum) -> Color {
        switch feedback {
        case .neutral: return .clear;
        case .correct: return .green;
        case .wrong: return .red;
        }
    }
}

#Preview {
    QuizView(path: Binding.constant([QuizNavigation.quizView]), data: Binding.constant(QuizData()))
}
