//
//  MountainCardView.swift
//  Travel
//
//  Created by Student on 16.03.2022.
//

import SwiftUI

struct MountainCardView: View {
    let mountain: Mountain
    var body: some View {
        ZStack{
            Image(mountain.image)
                .overlay(
                    LinearGradient(colors: [Color.black.opacity(0.15), Color.black], startPoint: .top, endPoint: .bottom)
                        .opacity(0.5)
                )
            VStack(alignment: .leading, spacing: 0) {
                Text("Mountain")
                    .foregroundColor(Color.white)
                    .font(.system(size: 14, weight: .medium))
                    .padding(.bottom, 2)
                Text(mountain.title)
                    .foregroundColor(Color.white)
                    .font(.system(size: 36, weight: .bold))
                    .padding(.bottom, 5)
                Text(mountain.locationDescription)
                    .foregroundColor(Color.white.opacity(0.3))
                    .font(.system(size: 10, weight: .regular))
                    .multilineTextAlignment(.leading)
            }
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            .padding(.bottom, 24)
        }
        .frame(width: 240, height: 300)
        .cornerRadius(5)
    }
}
