//
//  EndView.swift
//  Multi-Wiz
//
//  Created by Andrea Bottino on 27/01/2024.
//

import SwiftUI

struct EndView: View {
    
    @Binding var path: [QuizNavigation]
    @State private var viewModel = ViewModel(data: nil)
    
    var data: QuizData
    
    var body: some View {
        VStack(spacing: 40) {
            Spacer()
            
            VStack {
                Text("GAME OVER")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                Text("Final Score: \(data.correctAnswersCount)/\(data.numberOfQuestions)")
                    .font(.title2)
                    .fontWeight(.medium)
            }
            .padding(40)
            .background(.myPurple)
            .clipShape(.rect(cornerRadius: 20))
            
            Spacer()
            
            VStack(spacing: 30) {
                Button("Try Again") {
                    data.tryAgain()
                    path.removeLast()
                }
                .stylePrimaryButton()
                
                Button("Back to Setup") {
                    path.removeLast(2)
                }
                .styleSecondaryButton()
                
                Button("Back Home") {
                    path.removeAll()
                }
                .styleSecondaryButton()
            }
            
            Spacer()
        }
//        .onAppear(perform: {
//            print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
//        })
        .onAppear {
            viewModel.data = data
            viewModel.saveStats()
        }
        .navigationBarBackButtonHidden()
        .preferredColorScheme(.dark)
    }
}

#Preview {
    EndView(path: PreviewsData.path, data: PreviewsData.data)
}

