//
//  NavbarView.swift
//  Pokedex
//
//  Created by Maria Laura Pereira on 06/02/26.
//

import SwiftUI
struct NavbarView: View {
    
    var body: some View {
        NavigationStack {
            HStack(spacing: 25){
                NavigationLink {
                    HomeView()
                } label: {
                    Image(systemName: "house")
                    Text("Home")
                }
                
                NavigationLink {
                    PokemonListView()
                } label: {
                    Image(systemName: "cricket.ball")
                    Text("Pokémons")
                }
                
                NavigationLink {
                    HomeView()
                } label: {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
            }
            .foregroundColor(.white.adaptiveTextColor())
            
        }
        .frame(height: 20)
        .background(.clear)
    }
}

#Preview {
    NavbarView()
}
