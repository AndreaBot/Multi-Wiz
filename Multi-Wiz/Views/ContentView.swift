//
//  ContentView.swift
//  Multi-Wiz
//
//  Created by Andrea Bottino on 27/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var path = [QuizNavigation]()
    @State private var data = QuizData()
    
    var body: some View {
        NavigationStack(path: $path) {
            HomeScreenView(path: $path, data: $data)
            }
            .navigationTitle("Multi-Wiz")
    }
}


#Preview {
    ContentView()
}
