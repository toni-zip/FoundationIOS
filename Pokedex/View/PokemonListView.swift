//
//  PokemonListView.swift
//  Pokedex
//
//  Created by João Pedro Aveiro on 10/02/26.
//

import SwiftUI

struct PokemonListView: View {
    @State private var pokemons: [Pokemon]?

    var body: some View {
        NavigationStack {
            Group {
                if let pokemons {
                    List(pokemons) { pokemon in
                        NavigationLink {
                            PokemonDetailsView(pokeName: pokemon.name)
                        } label: {
                            PokemonCardView(pokemon: pokemon)
                        }
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                } else {
                    ProgressView("Carregando Pokémons...")
                }
                Spacer()
                NavbarView()
            }
            .navigationTitle("Pokémons")
        }
        .task {
            do {
                pokemons = try await PokeAPI.getPokemonList()
            } catch {
                print("Erro ao consultar API:", error.localizedDescription)
            }
        }
    }
    
}

#Preview {
    PokemonListView()
}
