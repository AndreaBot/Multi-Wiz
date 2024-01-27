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
    @State private var answer = ""
    @State private var allQuestions = [String]()
    @State private var correctAnswers = [Int]()
    @State private var question = ""
    @State private var gameOn = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Form {
                    Section {
                        Picker("I want to practice the multiplication table of:", selection: $baseNumber) {
                            ForEach(0..<10) { number in
                                if number != 0 && number != 1 {
                                    Text("\(number)")
                                }
                            }
                        }
                    }
                    
                    Section {
                        Stepper("Number of questions:  \(numberOfQuestions)", value: $numberOfQuestions, in: 5...20)
                    }
                    
                    HStack {
                        Spacer()
                        Button("START") {
                            gameOn.toggle()
                            if gameOn {
                                startGame(tableOf: baseNumber, numberOfQuestions)
                            }
                        }
                        Spacer()
                    }
                }
                .navigationTitle("Multi-Wiz")
                .opacity(gameOn ? 0 : 1)
                
                QuizView(question: $question, answer: $answer)
                    .opacity(gameOn ? 1 : 0)
            }
        }
    }
    
    func startGame(tableOf num: Int, _ nOfQuestions: Int) {
        gameOn = true
        let tuple = storeCorrectAnswers(num, numberOfQuestions)
        allQuestions = tuple.0
        correctAnswers = tuple.1
        question = allQuestions[0]
    }
    
    
    
    func storeCorrectAnswers( _ baseN: Int, _ nOfQuestions: Int) -> (allQuestions: [String], allResults: [Int]) {
        var questionArray = [String]()
        var resultArray = [Int]()
        
        for _ in (1...nOfQuestions) {
            let randomNumber = Int.random(in: 2...12)
            let result = baseN * randomNumber
            questionArray.append("\(baseN) x \(randomNumber)")
            resultArray.append(result)
        }
        return (questionArray, resultArray)
    }
}


#Preview {
    ContentView()
}
