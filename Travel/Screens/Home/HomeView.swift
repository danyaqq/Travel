//
//  HomeView.swift
//  Travel
//
//  Created by Student on 16.03.2022.
//

import SwiftUI

struct HomeView: View {
    @State var categories = ["all", "newbie", "Meduim", "Expert"]
    @State var selectedCategory = "all"
    @State var selectedMountain: Mountain? = nil
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .medium)
        ]
    }
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    ChooseLevelView()
                        .padding(.top, 20)
                        .padding(.bottom, 50)
                    NearestMountainView()
                        .padding(.bottom, 50)
                    PopularMountainView()
                }
                .navigationBarTitleDisplayMode(.inline)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.bottom, 29 + 29 + 40 + 16)
            }
            .background(
                RadialGradient(colors: [Color("t"), Color("b")], center: .bottom, startRadius: 120, endRadius: 360)
                    .ignoresSafeArea()
            )
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        
                    } label: {
                        Image("Menu")
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image("Search")
                    }
                }
            }
            .navigationTitle("Compass")
        }
        
    }
}

extension HomeView {
    @ViewBuilder
    func ChooseLevelView() -> some View {
        VStack(spacing: 25){
            Text("Choose level".uppercased())
                .foregroundColor(Color.white.opacity(0.4))
                .font(.system(size: 14, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 28)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 27) {
                    ForEach(categories, id: \.self) { category in
                        Text(category.uppercased())
                            .foregroundColor(selectedCategory == category ? Color.blue : Color.white.opacity(0.4))
                            .kerning(selectedCategory == category ? 1.6 : 1.2)
                            .font(.system(size: selectedCategory == category ? 16 : 12, weight: .medium))
                            .animation(.interactiveSpring(), value: selectedCategory)
                            .onTapGesture {
                                selectedCategory = category
                            }
                    }
                }
                .padding(.horizontal, 28)
            }
        }
    }
    
    @ViewBuilder
    func NearestMountainView() -> some View {
        VStack(spacing: 25) {
            Text("Nearest mountain".uppercased())
                .foregroundColor(Color.white.opacity(0.4))
                .font(.system(size: 14, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 28)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(Mountain.mountains, id: \.id) { mountain in
                        MountainCardView(mountain: mountain)
                            .onTapGesture {
                                selectedMountain = mountain
                            }
                            .fullScreenCover(item: $selectedMountain) { mountain in
                                DetailMountainView(mountain: mountain)
                            }
                    }
                }
                .padding(.horizontal, 28)
            }
        }
    }
    
    func PopularMountainView() -> some View {
        VStack(alignment: .leading, spacing: 25) {
            Text("Popular mountain".uppercased())
                .foregroundColor(Color.white.opacity(0.4))
                .font(.system(size: 14, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 28)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 18){
                    Image("Bitmap 3")
                        .frame(width: 150, height: 205)
                        .cornerRadius(5)
                        .overlay(
                            Text("Mountain")
                                .foregroundColor(Color.white)
                                .font(.system(size: 24, weight: .bold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 16)
                                .padding(.bottom)
                            ,alignment: .bottomLeading
                        )
                }
                .padding(.horizontal, 28)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
