//
//  DetailMountainView.swift
//  Travel
//
//  Created by Student on 16.03.2022.
//

import SwiftUI

struct DetailMountainView: View {
    @Environment(\.presentationMode) var presentationMode
    let mountain: Mountain
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    TopCardView()
                        .padding(.bottom, 25)
                    MiddleCardView()
                        .padding(.bottom, 40)
                        .padding(.leading, 28)
                    BottomSummaryView()
                }
                .padding(.bottom, 60 + 16 + 16)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("b").ignoresSafeArea())
            .edgesIgnoringSafeArea(.top)
            .overlay(
                ButtonsStack()
                ,alignment: .bottom
            )
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
                    Button {
                        
                    } label: {
                        Image("Search")
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

extension DetailMountainView {
    @ViewBuilder
    func TopCardView() -> some View {
        GeometryReader { reader in
            let size = reader.size
            ZStack {
                Image(mountain.image)
                    .resizable()
                    .scaledToFill()
                    .overlay(
                        LinearGradient(colors: [Color.black.opacity(0.15), Color("b")], startPoint: .top, endPoint: .bottom)
                    )
                    .frame(width: size.width, height: size.height)
                VStack(alignment: .leading, spacing: 0) {
                    Text("Mountain")
                        .foregroundColor(Color.white)
                        .font(.system(size: 14, weight: .medium))
                        .padding(.bottom, 2)
                    Text(mountain.title)
                        .foregroundColor(Color.white)
                        .font(.system(size: 48, weight: .bold))
                        .padding(.bottom, 5)
                    Text(mountain.locationDescription)
                        .foregroundColor(Color.white.opacity(0.3))
                        .font(.system(size: 10, weight: .regular))
                        .multilineTextAlignment(.leading)
                        .padding(.trailing, 30)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                .padding(.horizontal, 28)
            }
            .frame(width: size.width, height: size.height, alignment: .bottom)
        }
        .frame(height: UIScreen.main.bounds.height / 1.45, alignment: .top)
    }
    
    func MiddleCardView() -> some View {
        HStack(alignment: .top, spacing: 30) {
            VStack(alignment: .leading, spacing: 15) {
                Text("Height".uppercased())
                    .foregroundColor(Color.white.opacity(0.5))
                    .font(.system(size: 14, weight: .medium))
                Text("\(String(format: "%.3f", mountain.height)) MDPL")
                    .foregroundColor(Color.white)
                    .font(.system(size: 16, weight: .semibold))
            }
            
            VStack(alignment: .leading, spacing: 15) {
                Text("Coordinat".uppercased())
                    .foregroundColor(Color.white.opacity(0.5))
                    .font(.system(size: 14, weight: .medium))
                Text("lat: \(String(format: "%.3f", mountain.coordinat.latitude))\nlon: \(String(format: "%.3f",mountain.coordinat.longitude))")
                    .foregroundColor(Color.white)
                    .font(.system(size: 16, weight: .semibold))
                    .multilineTextAlignment(.leading)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func BottomSummaryView() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Summary".uppercased())
                .foregroundColor(Color.white.opacity(0.5))
                .font(.system(size: 14, weight: .medium))
            Text(mountain.summary)
                .foregroundColor(Color.white.opacity(0.3))
                .font(.system(size: 14, weight: .regular))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 28)
    }
    
    func ButtonsStack() -> some View {
        HStack(spacing: 19) {
            Button {
                
            } label: {
                Circle()
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color.white)
                    .overlay(
                        Image("heart-1")
                    )
            }
            .buttonStyle(PlainButtonStyle())
            
            NavigationLink(destination: {
                MountainRouteView(mountain: mountain)
            }, label: {
                Text("Start Journey".uppercased())
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(Color.blue)
                    .cornerRadius(30)
            })
            .buttonStyle(PlainButtonStyle())
        }
        .padding(.horizontal, 28)
        .padding(.bottom)
    }
}
