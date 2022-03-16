//
//  MountainRouteView.swift
//  Travel
//
//  Created by Student on 16.03.2022.
//

import SwiftUI

struct MountainRouteView: View {
    @Environment(\.presentationMode) var presentationMode
    let mountain: Mountain
    var body: some View {
        VStack(spacing: 0) {
            CustomMapView()
                .frame(height: 240)
            ScrollView(.vertical, showsIndicators: false) {
                PositionView()
                    .padding(.top, 20)
                    .padding(.bottom, 50)
                MountainCondition()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("b").ignoresSafeArea())
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color.white)
                        .font(.system(size: 18))
                }
            }
            
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                VStack(alignment: .trailing, spacing: 4){
                    Text("\(mountain.title) Mountain".uppercased())
                        .foregroundColor(Color.white)
                        .font(.system(size: 16, weight: .semibold))
                    Text("\(String(format: "%.3f", mountain.height)) MDPL ( 7.5°S 110.4°E )")
                        .foregroundColor(Color.white.opacity(0.4))
                        .font(.system(size: 11))
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
}


extension MountainRouteView {
    func PositionView() -> some View {
        VStack(spacing: 25) {
            Text("your position".uppercased())
                .foregroundColor(Color.white.opacity(0.4))
                .font(.system(size: 14, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack(spacing: 15.5) {
                Circle()
                    .stroke(lineWidth: 1.5)
                    .frame(width: 22.5, height: 22.5)
                    .foregroundColor(Color.white)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Checkpoint 2 to Camp Ground 3")
                        .foregroundColor(Color.white)
                        .font(.system(size: 14, weight: .medium))
                    Text("2.545 MDPL ( 6.1° S 110,2° E )")
                        .foregroundColor(Color.white.opacity(0.3))
                        .font(.system(size: 10, weight: .regular))
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Button {
                
            } label: {
                HStack(spacing: 0) {
                    Text("Add your friend position  ".uppercased())
                    Image(systemName: "plus")
                }
                .foregroundColor(Color.blue)
                .font(.system(size: 14, weight: .medium))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 28)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func MountainCondition() -> some View {
        VStack(alignment: .leading, spacing: 25) {
            Text("mountain conditions".uppercased())
                .foregroundColor(Color.white.opacity(0.4))
                .font(.system(size: 14, weight: .medium))
            VStack(spacing: 15) {
                ForEach(mountain.conditions, id: \.self) { condition in
                    ConditionCardView(description: condition.description, image: condition.image, title: condition.title)
                }
            }
        }
        .padding(.horizontal, 28)
    }
}
