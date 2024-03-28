//
//  HomeScreenView.swift
//  Multi-Wiz
//
//  Created by Andrea Bottino on 10/02/2024.
//

import SwiftUI

struct HomeScreenView: View {

    @State private var path = [QuizNavigation]()
    @State private var data = QuizData()
    
    var body: some View {
        NavigationStack(path: $path) {
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
                    }
                    .stylePrimaryButton()
                    
                    Button {
                        path.append(.allStatsView)
                    } label: {
                        Text("MY STATS")
                    }
                    .styleSecondaryButton()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .navigationDestination(for: QuizNavigation.self) { destination in
                    if destination == .settingsView {
                        SettingsView(path: $path, data: $data)
                    } else if destination == .allStatsView {
                        AllStatsView()
                    } else if destination == .quizView {
                        QuizView(path: $path, data: $data)
                    } else if destination == .endView {
                        EndView(path: $path, data: $data)
                    }
                }
            }
            .navigationTitle("Multi Wiz")
        }
    }
}

#Preview {
    HomeScreenView()
}
