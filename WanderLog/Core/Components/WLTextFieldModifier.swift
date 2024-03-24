//
//  WLTextModifier.swift
//  WanderLog
//
//  Created by Tanushree Arora on 3/23/24.
//

import SwiftUI

struct WLTextFieldModifier: ViewModifier {
    func body(content: Content ) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
   
}


