//
//  PokemonDetailsView.swift
//  Pokedex
//
//  Created by Maria Laura Pereira on 09/02/26.
//

import SwiftUI

struct PokemonDetailsView: View {
    let pokeName: String
    /*let type: String*/
    @State private var pokemonDetails: PokemonDetailsResponse?
    
    private var imageURL: URL? {
        if let pokemonDetails {
            return URL(string: (pokemonDetails.sprites.frontDefault))
        }
        
        return nil
    }
    
    var body: some View {
        
        Group {
            Text(pokeName)

            
            AsyncImage(url: imageURL) { image in
                image
            } placeholder: {
                ProgressView()
            }
            Spacer()
            NavbarView(color: .white)
            
        }
        
        .task {
            do {
                pokemonDetails = try await PokeAPI.getPokemonDetails(pokemonName: pokeName)
                
            } catch {
                print("Erro ao consultar image ", error.localizedDescription)
            }
            /*do{
                pokemonDetails = try await PokeAPI.getPokemonDetails(pokemonName: type)
            }catch{
                print("Erro ao consultar tipo")
            }*/
        
        }
    
    }
    
}

#Preview {
    PokemonDetailsView(pokeName: "bulbasaur")
}
