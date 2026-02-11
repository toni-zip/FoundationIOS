//
//  PokemonListView.swift
//  Pokedex
//
//  Created by João Pedro Aveiro on 10/02/26.
//

import SwiftUI

struct PokemonListView: View {
    @State private var pokemons: [Pokemon]?
    @State private var searchText: String = ""
    
    private var filteredPokemons: [Pokemon] {
        guard let pokemons else { return [] }
        if searchText.isEmpty {
            return pokemons
        } else {
            return pokemons.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                            BackgroundView {
                                if let pokemons {
                                    List(filteredPokemons) { pokemon in
                                        NavigationLink {
                                            PokemonDetailsView(pokeName: pokemon.name)
                                        } label: {
                                            PokemonCardView(pokemon: pokemon)
                                        }
                                        .listRowSeparator(.hidden)
                                        .listRowBackground(Color.clear)
                                    }
                                    .listStyle(.plain)
                                    .scrollContentBackground(.hidden)
                                    .safeAreaInset(edge: .top) {
                                        Color.clear.frame(height: geometry.size.height * 0.25)
                                    }
                                } else {
                                    ProgressView("Carregando Pokemons...")
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                }
                            }
                        }
                        .navigationTitle("Pokédex")
                        .searchable(text: $searchText, prompt: "Busque aqui!")
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
