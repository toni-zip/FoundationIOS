//
//  DashboardNavigation.swift
//  Pokedex
//
//  Created by João Pedro Aveiro on 12/02/26.
//
import SwiftUI

struct DashboardNavigation: View {
    @State private var selectedPage = 0
    @State private var isShowingWellcomeScreen = true
    
    var body: some View {
            TabView(selection: $selectedPage) {
                NavigationStack {
                    PokemonListView()
                }
                    .tag(1)
                    .tabItem { Label("Pokédex", systemImage: "person.3.fill") }
                
                ProfileView()
                    .tag(2)
                    .tabItem { Label("Profile", systemImage: "person.3.fill") }
            }
            .fullScreenCover(isPresented: $isShowingWellcomeScreen, content: {
                HomeView(isShowingWelcomeScreen: $isShowingWellcomeScreen)
            })
            .indexViewStyle(
                PageIndexViewStyle(backgroundDisplayMode: .always))

            .toolbar(.hidden, for: .tabBar)

            .navigationTitle("Pokedex")
    }
}


#Preview { DashboardNavigation() }
