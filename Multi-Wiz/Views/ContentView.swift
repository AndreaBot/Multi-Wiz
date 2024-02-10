//
//  ContentView.swift
//  Multi-Wiz
//
//  Created by Andrea Bottino on 27/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
            NavigationStack {
                HomeScreenView()
            }
            .navigationTitle("Multi-Wiz")
        
    }
}


#Preview {
    ContentView()
}
