//
//  SettingsView.swift
//  Multi-Wiz
//
//  Created by Andrea Bottino on 27/01/2024.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var baseNumber = 2
    @State private var numberOfQuestions = 5
    
    var body: some View {
        VStack {
            Spacer()
            
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
                
                Section {
                    NavigationLink {
                        QuizView(baseNumber: baseNumber, numberOfQuestions: numberOfQuestions)
                    } label: {
                        Text("START")
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            .scrollDisabled(true)
            .scrollContentBackground(.hidden)
            
            Spacer()
        }
        .background(.myPurple)
        .navigationTitle("Setup")
    }
}

#Preview {
    SettingsView()
}