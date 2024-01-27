//
//  ContentView.swift
//  Multi-Wiz
//
//  Created by Andrea Bottino on 27/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var baseNumber = 2
    @State private var numberOfQuestions = 1
    @State private var userAnswer = ""
    @State private var allQuestions = [QuestionModel]()
    @State private var questionIndex = 0
    @State private var gameOn = false
    @State private var backHome = false
    
    var body: some View {
        NavigationView {
            NavigationStack {
                
                if gameOn {
                    QuizView(baseNumber: $baseNumber, allQuestions: $allQuestions, userAnswer: $userAnswer, questionIndex: $questionIndex, numberOfQuestions: $numberOfQuestions, backHome: $backHome, gameOn: $gameOn)
                    
                } else {
                    SettingsView(baseNumber: $baseNumber, numberOfQuestions: $numberOfQuestions, userAnswer: $userAnswer, allQuestions: $allQuestions, questionIndex: $questionIndex, gameOn: $gameOn, backHome: $backHome)
                }
            }
            .navigationTitle("Multi-Wiz")
        }
    }
}


#Preview {
    ContentView()
}
