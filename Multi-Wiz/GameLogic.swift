//
//  GameLogic.swift
//  Multi-Wiz
//
//  Created by Andrea Bottino on 27/01/2024.
//

import SwiftUI

struct GameLogic {
    
    static  func createQuiz( _ baseN: Int, _ nOfQuestions: Int) -> [QuestionModel] {
        var questionArray = [QuestionModel]()
        
        for _ in (1...nOfQuestions) {
            let randomNumber = Int.random(in: 2...12)
            let result = baseN * randomNumber
            let questionString = "\(baseN) x \(randomNumber)"
            let questionResult = (String(result))
            let newQuestion = QuestionModel(q: questionString, a: questionResult)
            questionArray.append(newQuestion)
            
        }
        return questionArray
    }
    
    static func feedbackColor(_ feedback: FeedbackEnum) -> Color {
        switch feedback {
        case .neutral: return .clear;
        case .correct: return .green;
        case .wrong: return .red;
        }
    }
}
