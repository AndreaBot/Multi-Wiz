//
//  QuizView.swift
//  Multi-Wiz
//
//  Created by Andrea Bottino on 27/01/2024.
//

import SwiftUI

struct QuizView: View {
    
    @Binding var question: String
    @Binding var answer: String
    
    var body: some View {
        Form {
            Section {
                Text("What is")
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                Text(question)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
            }
            Section {
                TextField("Type your answer", text: $answer)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
            }
            
            Section {
                Button("Check Your Answer") {
                    
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}
