//
//  ConditionCardView.swift
//  Travel
//
//  Created by Student on 16.03.2022.
//

import SwiftUI

struct ConditionCardView: View {
    let description: String
    let image: String
    let title: String
    var body: some View {
        HStack(spacing: 20) {
            Image(image)
                .frame(width: 34)
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .foregroundColor(Color.white.opacity(0.3))
                    .font(.system(size: 12))
                Text(description)
                    .foregroundColor(Color.white)
                    .font(.system(size: 14))
            }
        }
        .padding(.horizontal, 25)
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 60)
        .background(Color("tab"))
        .cornerRadius(5)
    }
}

