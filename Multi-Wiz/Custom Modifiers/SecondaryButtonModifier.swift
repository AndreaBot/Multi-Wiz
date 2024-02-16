//
//  SecondaryButtonModifier.swift
//  Multi-Wiz
//
//  Created by Andrea Bottino on 11/02/2024.
//

import SwiftUI

struct SecondaryButtonModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundStyle(.primary)
            .containerRelativeFrame(.horizontal) { size, axis in
                size * 0.5
            }
            .padding()
            .background(.clear)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.primary, lineWidth: 3))
    }
}

extension View {
    
    func styleSecondaryButton() -> some View {
        modifier(SecondaryButtonModifier())
    }
    
}
