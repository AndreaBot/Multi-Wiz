//
//  QuestionModel.swift
//  Multi-Wiz
//
//  Created by Andrea Bottino on 27/01/2024.
//

import Foundation

struct QuestionModel {
    
    let question: String
    let correctAnswer: String
    
    init(q: String, a: String) {
        self.question = q
        self.correctAnswer = a
    }
}
