//
//  PokemonMiniCard.swift
//  Pokedex
//
//  Created by Maria Laura Pereira on 11/02/26.
//


import SwiftUI

struct PokemonMiniCard: View {
    
    let pokemon: Pokemon
    @State private var pokemonDetails: PokemonDetailsResponse?
    
    private var imageURL: URL? {
        if let pokemonDetails {
            return URL(string: pokemonDetails.sprites.frontDefault)
        }
        return nil
    }
    
    var body: some View {
        VStack(spacing: 8) {
            
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemGray6))
                    .frame(height: 100)
                
                AsyncImage(url: imageURL) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                } placeholder: {
                    ProgressView()
                }
            }
            
            Text(pokemon.name.capitalized)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(Color.white.adaptiveTextColor())
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .multilineTextAlignment(.center)
        .task {
            do {
                pokemonDetails = try await PokeAPI.getPokemonDetails(
                    pokemonName: pokemon.name
                )
            } catch {
                print("Erro no MiniCard:", error.localizedDescription)
            }
        }
    }
}

#Preview {
    PokemonMiniCard(
        pokemon: Pokemon(
            name: "bulbasaur",
            url: "https://pokeapi.co/api/v2/pokemon/1/"
        )
    )
}
