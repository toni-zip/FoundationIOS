//
//  PokemonDetailsView.swift
//  Pokedex
//
//  Created by Maria Laura Pereira on 09/02/26.
//

import SwiftUI

struct PokemonDetailsView: View {
    let pokeName: String
    @State private var pokemonDetails: PokemonDetailsResponse?
    @EnvironmentObject private var store: PokedexStore

    private var isFavorite: Bool {
        store.isFavorite(name: pokeName)
    }

    private var isInTeam: Bool {
        store.isInTeam(name: pokeName)
    }

    var body: some View {
        BackgroundView {
            VStack {
                Text(pokeName.capitalized)
                    .font(.largeTitle)
                    .bold()
                
                if let details = pokemonDetails {
                    AsyncImage(url: URL(string: details.sprites.frontDefault)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                    } placeholder: {
                        ProgressView()
                    }
                } else {
                    ProgressView()
                        .frame(width: 150, height: 150)
                }
            }
            
            Spacer()
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    store.toggleFavorite(name: pokeName)
                } label: {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundStyle(isFavorite ? .red : .primary)
                }

                Button {
                    store.toggleTeam(name: pokeName)
                } label: {
                    Image(systemName: isInTeam ? "person.3.fill" : "person.3")
                }
                .disabled(!isInTeam && store.isTeamFull)

                NavigationLink {
                    ProfileView()
                        .environmentObject(store)
                } label: {
                    Image(systemName: "person.crop.circle")
                }
            }
        }
        .task {
            do {
                pokemonDetails = try await PokeAPI.getPokemonDetails(pokemonName: pokeName)
            } catch {
                print("Erro ao consultar detalhes do Pokémon:", error.localizedDescription)
            }
        }
    }
}


#Preview {
    PokemonDetailsView(pokeName: "bulbasaur")
        .environmentObject(PokedexStore())
}
