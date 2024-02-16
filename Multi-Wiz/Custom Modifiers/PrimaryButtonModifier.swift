//
//  PrimaryButtonModifier.swift
//  Multi-Wiz
//
//  Created by Andrea Bottino on 11/02/2024.
//

import SwiftUI

struct PrimaryButtonModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundStyle(.black)
            .containerRelativeFrame(.horizontal) { size, axis in
                size * 0.5
            }
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func stylePrimaryButton() -> some View {
        modifier(PrimaryButtonModifier())
    }
}
