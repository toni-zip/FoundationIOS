//
//  ProfileView.swift
//  Pokedex
//
//  Created by Maria Laura Pereira on 11/02/26.
//

import SwiftUI
struct ProfileView: View {
    
    
    let favoritePokemons: [Pokemon] = [
        Pokemon(name: "mew", url: ""),
        Pokemon(name: "charizard", url: ""),
        Pokemon(name: "pikachu", url: "")
    ]
    
    let teamPokemons: [Pokemon] = [
        Pokemon(name: "venusaur", url: ""),
        Pokemon(name: "blastoise", url: "")
    ]
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            GeometryReader{ Geometry in
            BackgroundView {
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Profile")
                                .font(.largeTitle)
                                .bold()
                            
                            Text("Your Pokémon collection")
                                .foregroundStyle(.secondary)
                        }
                        .padding(.horizontal)
                        
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("My Team")
                                .font(.title2)
                                .bold()
                                .padding(.horizontal)
                            
                            LazyVGrid(columns: columns, spacing: 16) {
                                ForEach(teamPokemons) { pokemon in
                                    PokemonMiniCard(pokemon: pokemon)
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Favorites")
                                .font(.title2)
                                .bold()
                                .padding(.horizontal)
                            
                            LazyVGrid(columns: columns, spacing: 16) {
                                ForEach(favoritePokemons) { pokemon in
                                    PokemonMiniCard(pokemon: pokemon)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                        
                        Spacer(minLength: 40)
                    }
                    .padding(.top)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    ProfileView()
}

