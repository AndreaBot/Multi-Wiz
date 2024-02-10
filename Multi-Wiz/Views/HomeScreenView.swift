//
//  HomeScreenView.swift
//  Multi-Wiz
//
//  Created by Andrea Bottino on 10/02/2024.
//

import SwiftUI

struct HomeScreenView: View {
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
                    
                    NavigationLink {
                       SettingsView()
                    } label: {
                        Text("START")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                    
                    NavigationLink {
                        AllStatsView()
                    } label: {
                        Text("MY STATS")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                }
            .navigationTitle("Multi Wiz")
        }
    }
}

#Preview {
    HomeScreenView()
}
