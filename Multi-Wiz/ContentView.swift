//
//  ContentView.swift
//  Multi-Wiz
//
//  Created by Andrea Bottino on 27/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var baseNumber = 2
    @State private var numberOfQuestions = 5
    @State private var userAnswer = ""
    @State private var allQuestions = [QuestionModel]()
    @State private var questionIndex = 0
    @State private var gameOn = false
    @State private var backHome = false
    @State private var correctAnswerCount = 0
    
    var body: some View {
        NavigationView {
            NavigationStack {
                
                if gameOn {
                    QuizView(baseNumber: $baseNumber, allQuestions: $allQuestions, userAnswer: $userAnswer, questionIndex: $questionIndex, numberOfQuestions: $numberOfQuestions, backHome: $backHome, gameOn: $gameOn, correctAnswersCount: $correctAnswerCount)
                    
                } else {
                    SettingsView(baseNumber: $baseNumber, numberOfQuestions: $numberOfQuestions, allQuestions: $allQuestions,  gameOn: $gameOn)
                }
            }
            .navigationTitle("Multi-Wiz")
        }
    }
}


#Preview {
    ContentView()
}
