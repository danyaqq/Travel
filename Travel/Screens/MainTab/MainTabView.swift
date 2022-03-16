//
//  MainTabView.swift
//  Travel
//
//  Created by Student on 16.03.2022.
//

import SwiftUI

enum Tabs: String, CaseIterable {
    case home = "compass"
    case agenda = "calendar"
    case favorite = "heart"
    case profile = "profile"
}

struct MainTabView: View {
    @State var selection: Tabs = .home
    init() {
        UITabBar.appearance().isHidden = true
        UINavigationBar.appearance().barTintColor = UIColor(named: "b")
    }
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tag(Tabs.home)
            CalendarView()
                .tag(Tabs.agenda)
            FavoriteView()
                .tag(Tabs.favorite)
            ProfileView()
                .tag(Tabs.profile)
        }
        .overlay(
            CutstomTabView(selection: $selection)
            ,alignment: .bottom
        )
    }
}


struct CutstomTabView: View {
    @Binding var selection: Tabs
    var body: some View {
        HStack(spacing: 0) {
            ForEach(Tabs.allCases, id: \.self) { tab in
                Button {
                    selection = tab
                } label: {
                    Image(tab.rawValue)
                        .renderingMode(.template)
                        .foregroundColor(selection == tab ? .blue: .white.opacity(0.8))
                        .animation(.default, value: selection)
                        .frame(maxWidth: .infinity)
                }
            }
        }
        .padding(.vertical, 29)
        .background(Color("tab").clipShape(CustomShape()).edgesIgnoringSafeArea(.bottom))
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
