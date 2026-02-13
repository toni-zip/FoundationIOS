//
//  PokeFormView.swift
//  Pokedex
//
//  Created by João Pedro Aveiro on 13/02/26.
//

import SwiftUI

struct PokemonFormView: View {
    let formName: String
    @State private var formDetails: PokemonDetailsResponse?

    var body: some View {
        VStack {
            if let sprite = formDetails?.sprites.frontDefault {
                AsyncImage(url: URL(string: sprite)) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 80, height: 80)
                .background(Color.white.opacity(0.2))
                .clipShape(Circle())
            }
            
            Text(formName.capitalized)
                .font(.caption.bold())
        }
        .task {
            formDetails = try? await PokeAPI.getPokemonDetails(pokemonName: formName)
        }
    }
}
