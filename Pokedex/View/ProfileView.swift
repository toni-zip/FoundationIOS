//
//  ProfileView.swift
//  Pokedex
//
//  Created by Maria Laura Pereira on 11/02/26.
//

import SwiftUI

struct ProfileView: View {
    @Environment(PokedexStore.self) private var store
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView {
                    Color.clear
                }
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 0) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.black)
                                .opacity(0.1)
                                .frame(height: 130)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.blue.opacity(0.2), lineWidth: 1)
                                )
                            
                            HStack(spacing: 20) {
                                ZStack {
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 80, height: 80)
                                        .shadow(radius: 4)
                                    
                                    Image(systemName: "person.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 45, height: 45)
                                        .foregroundColor(.gray)
                                }
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Pokémon Trainer")
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.secondary)
                                        .textCase(.uppercase)
                                    
                                    Text("FoundationU")
                                        .font(.title)
                                        .bold()
                                    
                                    Text("ID: #250199")
                                        .font(.footnote)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                            }
                            .padding(.horizontal, 30)
                        }
                        .padding(.horizontal)
                        .padding(.top, 100)
                        .padding(.bottom, 20)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: "person.3.fill")
                                Text("My Team (\(store.teamPokemons.count)/6)")
                                    .font(.title2)
                                    .bold()
                            }.padding(.horizontal)
                            
                            LazyVGrid(columns: columns, spacing: 16) {
                                if store.teamPokemons.isEmpty {
                                    NavigationLink(destination: PokemonListView()) {
                                        PokemonMiniCardEmpty(title: "Add a pokémon")
                                    }
                                } else {
                                    ForEach(store.teamPokemons) { pokemon in
                                        NavigationLink(destination: PokemonDetailsView(pokeName: pokemon.name)) {
                                            PokemonMiniCard(pokemon: pokemon)
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        .padding(.vertical)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: "heart.fill")
                                Text("Favorites")
                                    .font(.title2)
                                    .bold()
                            }.padding(.horizontal)
                            
                            LazyVGrid(columns: columns, spacing: 16) {
                                if store.favoritePokemons.isEmpty {
                                    NavigationLink(destination: PokemonListView()) {
                                        PokemonMiniCardEmpty(title: "Add a pokémon")
                                    }
                                } else {
                                    ForEach(store.favoritePokemons) { pokemon in
                                        NavigationLink(destination: PokemonDetailsView(pokeName: pokemon.name)) {
                                            PokemonMiniCard(pokemon: pokemon)
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        .padding(.vertical)
                        
                        Spacer(minLength: 40)
                    }
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ProfileView()
        .environment(PokedexStore())
}
