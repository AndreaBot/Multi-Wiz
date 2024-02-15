//
//  HomeScreenView.swift
//  Multi-Wiz
//
//  Created by Andrea Bottino on 10/02/2024.
//

import SwiftUI

struct HomeScreenView: View {
    
    @Binding var path: [QuizNavigation]
    @Binding var data: QuizData
    
    var body: some View {
            ZStack {
                Color(.myPurple)
                    .ignoresSafeArea()
                
                VStack(spacing: 40) {
                    Image(.X)
                        .resizable()
                        .scaledToFit()
                        .containerRelativeFrame(.horizontal) { size, axis  in
                            size * 0.8
                        }
                    
                    Button {
                        path.append(.settingsView)
                    } label: {
                        Text("START")
                            .stylePrimaryButton()
                    }
                    
                    Button {
                        path.append(.allStatsView)
                    } label: {
                        Text("MY STATS")
                    }
                    .styleSecondaryButton()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Multi Wiz")
            .navigationDestination(for: QuizNavigation.self) { destination in
                if destination == .settingsView {
                    SettingsView(path: $path, data: $data)
                } else if destination == .allStatsView {
                    AllStatsView(path: $path)
                } else if destination == .quizView {
                    QuizView(path: $path, data: $data)
                } else if destination == .endView {
                    EndView(path: $path, data: $data)
                }
            }
        }
    }
}

#Preview {
    HomeScreenView(path: PreviewsData.path, data: PreviewsData.data)
}
