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
}
