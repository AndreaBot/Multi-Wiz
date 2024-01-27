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
    @Binding var backHome: Bool
    @Binding var gameOn: Bool
    @FocusState var txtFieldFocused: Bool
    
    var body: some View {
        VStack(spacing: 40) {
            Text("GAME OVER")
                .font(.largeTitle)
                .frame(height: UIScreen.main.bounds.size.height * 0.4)
            
            Button("Try Again") {
                allQuestions = GameLogic.createQuiz(baseNumber, numberOfQuestions)
                backHome = false
                questionIndex = 0
                txtFieldFocused = true
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
