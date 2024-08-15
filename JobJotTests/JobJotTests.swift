//
//  JobJotTests.swift
//  JobJotTests
//
//  Created by Andrea Bottino on 15/08/2024.
//

import XCTest
@testable import Multi_Wiz

final class JobJotTests: XCTestCase {
    
    var sut: QuizData!
    
    override func setUpWithError() throws {
        sut = QuizData()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testPerformanceExample() throws {
        measure {
            sut.createQuiz()
        }
    }
    
    func test_QuizData_successfullyCreateQuiz() {
        sut.numberOfQuestions = 3
        
        sut.createQuiz()
        
        XCTAssertEqual(sut.allQuestions.count, sut.numberOfQuestions)
    }
    
    func test_QuizData_recognisesCorrectAnswer() {
        let questionString = "2 x 7"
        sut.allQuestions.append(QuestionModel(q: questionString, a: "14"))
        sut.userAnswer = "14"
        
        sut.checkAnswer()
        
        XCTAssertEqual(sut.userAnswer, sut.allQuestions[0].correctAnswer)
        XCTAssertEqual(sut.correctAnswersCount, 1)
    }
    
}
