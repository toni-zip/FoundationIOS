//
//  MockView.swift
//  Pokedex
//
//  Created by PokeGroup on 06/02/26.
//

import SwiftUI

struct MockView: View {
    @State var pokemons: [Pokemon]?
    
    var body: some View {
        NavigationStack {
            
                
                if let pokemons {
                    List(pokemons){ pokemon in
                        NavigationLink{
                            PokemonDetailsView(pokeName: pokemon.name)
                        }
                        label: {
                            Text(pokemon.name)
                        }
                    }
                } else {
                    ProgressView()
                }
                
            }
            .task {
                do {
                    pokemons = try await PokeAPI.getPokemonList()
                    
                } catch {
                    print("Erro ao  consultar api ", error.localizedDescription)
                }
            }
        }
    }
    
    struct SwiftUIView_Previews: PreviewProvider {
        static var previews: some View {
            MockView()
        }
    }

