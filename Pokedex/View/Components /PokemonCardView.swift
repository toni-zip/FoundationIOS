//
//  PokemonCardView.swift
//  Pokedex
//
//  Created by Maria Laura Pereira on 10/02/26.
//

import SwiftUI

struct PokemonCardView: View {
    let pokemon: Pokemon
    @State private var pokemonDetails: PokemonDetailsResponse?

    private var imageURL: URL? {
        if let pokemonDetails {
            return URL(string: pokemonDetails.sprites.frontDefault)
        }
        return nil
    }
    
    private var typeGradient: LinearGradient {
            let colors: [Color]
            if let types = pokemonDetails?.types, !types.isEmpty {
                colors = types.map { Color.pokemonType(type: $0.type.name) }
            } else {
                colors = [.gray, .gray.opacity(0.5)]
            }
            
            let finalColors = colors.count == 1 ? [colors[0], colors[0]] : colors
            
            return LinearGradient(
                colors: finalColors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        }

    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                RoundedRectangle(cornerRadius: 100)
                    .fill(Color.gray.opacity(0.1))
                    .frame(width: 90, height: 90)
                    .overlay(
                        RoundedRectangle(cornerRadius: 100)
                            .strokeBorder(typeGradient, lineWidth: 3)
                            .background(.white)
                            .cornerRadius(100)
                    )

                AsyncImage(url: URL(string: pokemonDetails?.sprites.frontDefault ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 75, height: 75)
                } placeholder: {
                    ProgressView()
                }
            }

            
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 0) {
                    Text(pokemon.name.capitalized)
                        .font(.headline)
                    Text("#\(pokemonDetails?.id ?? 0)")
                        .fontWeight(.ultraLight)
                }

                if let types = pokemonDetails?.types {
                    HStack(spacing: 6) {
                        ForEach(types, id: \.type.name) { typeSlot in
                            Text(typeSlot.type.name.capitalized)
                                .font(.caption2)
                                .foregroundStyle(.white)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(
                                    Color.pokemonType(type: typeSlot.type.name)
                                    , in: RoundedRectangle(cornerRadius: 12)
                                )
                        }
                    }
                }
            }

            Spacer()

        }
        .padding()
        .frame(height: 120)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemGray6))
        )

        .task {
            do {
                pokemonDetails = try await PokeAPI.getPokemonDetails(
                    pokemonName: pokemon.name
                )
            } catch {
                print("Erro ao carregar detalhes:", error.localizedDescription)
            }
        }
    }
}

#Preview {
    PokemonCardView(
        pokemon: Pokemon(
            name: "bulbasaur",
            url: "https://pokeapi.co/api/v2/pokemon/1/"
        )
    )
}
