//
//  SettingsView.swift
//  Multi-Wiz
//
//  Created by Andrea Bottino on 27/01/2024.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var path: [QuizNavigation]
    @Binding var data: QuizData

    
    var body: some View {
        VStack {
            Spacer()
                .containerRelativeFrame(.vertical) { size, axis in
                    size * 0.25}
            
            Form {
                Section {
                    Picker("Base number:", selection: $data.baseNumber) {
                        ForEach(0..<10) { number in
                            if number != 0 && number != 1 {
                                Text("\(number)")
                            }
                        }
                    }
                }
                
                Section {
                    Stepper("Number of questions:  \(data.numberOfQuestions)", value: $data.numberOfQuestions, in: 5...20)
                }
                
                Section {
                    Button {
                        path.append(.quizView)
                    } label: {
                        Text("START")
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            .scrollDisabled(true)
            .scrollContentBackground(.hidden)
        }
        .background(.myPurple)
        .navigationTitle("Setup")
        .onAppear {
            data.questionIndex = 0
        }
    }
}

#Preview {
    SettingsView(path: PreviewsData.path, data: PreviewsData.bindingData)
}
