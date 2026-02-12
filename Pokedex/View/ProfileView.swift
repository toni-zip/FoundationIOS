//
//  ProfileView.swift
//  Pokedex
//
//  Created by Maria Laura Pereira on 11/02/26.
//

import SwiftUI
struct ProfileView: View {
    @EnvironmentObject private var store: PokedexStore

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationStack {
            GeometryReader { Geometry in
                BackgroundView {
                    ScrollView {
                            VStack(alignment: .leading, spacing: 12) {
                                Text("My Team")
                                    .font(.title2)
                                    .bold()
                                    .padding(.horizontal)

                                LazyVGrid(columns: columns, spacing: 16) {
                                    ForEach(store.teamPokemons) { pokemon in
                                        PokemonMiniCard(pokemon: pokemon)
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.horizontal)
                            }


                            VStack(alignment: .leading, spacing: 12) {
                                Text("Favorites")
                                    .font(.title2)
                                    .bold()
                                    .padding(.horizontal)

                                LazyVGrid(columns: columns, spacing: 16) {
                                    ForEach(store.favoritePokemons) { pokemon in
                                        PokemonMiniCard(pokemon: pokemon)
                                    }
                                }
                                .navigationTitle("Profile")
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.horizontal)
                            }
                        }

                        Spacer(minLength: 40)
                    }
                    .padding(.top)
                }
            } // n
            .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    ProfileView()
        .environmentObject(PokedexStore())
}
