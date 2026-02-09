//
//  PokemonDetailsView.swift
//  Pokedex
//
//  Created by Maria Laura Pereira on 09/02/26.
//

import SwiftUI

struct PokemonDetailsView: View {
    let pokeName: String
    @State var pokemonDetails: PokemonDetailsResponse?
    
    var body: some View {
        Text(pokeName)
        AsyncImage(url: pokemonDetails.)
        
            .task {
                do {
                    pokemonDetails = try await PokeAPI.getPokemonDetails(pokemonName: pokeName)
                    
                } catch {
                    print("Erro ao  consultar api ", error.localizedDescription)
                }
            }
    }
    
}

#Preview {
    PokemonDetailsView(pokeName: "bulbasaur")
}
