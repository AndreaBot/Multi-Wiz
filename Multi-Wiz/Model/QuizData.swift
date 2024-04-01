//
//  QuizData.swift
//  Multi-Wiz
//
//  Created by Andrea Bottino on 15/02/2024.
//

import Foundation

@Observable
class QuizData {
    
    var baseNumber = 2
    var numberOfQuestions = 5
    var questionIndex = 0
    var allQuestions = [QuestionModel]()
    var correctAnswersCount = 0
    
    var userAnswer = ""
    var result: FeedbackEnum = .neutral
    
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
    }
    
    func createQuiz() {
       var questionArray = [QuestionModel]()
       
       for _ in (1...numberOfQuestions) {
           let randomNumber = Int.random(in: 2...12)
           let result = baseNumber * randomNumber
           let questionString = "\(baseNumber) x \(randomNumber)"
           let questionResult = (String(result))
           let newQuestion = QuestionModel(q: questionString, a: questionResult)
           questionArray.append(newQuestion)
           
       }
       allQuestions = questionArray
   }
    
    func tryAgain() {
        createQuiz()
        questionIndex = 0
        correctAnswersCount = 0
    }
}
