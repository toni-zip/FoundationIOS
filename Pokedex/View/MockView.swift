import SwiftUI

struct MockView: View {
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
                NavbarView(color: .white)
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
    MockView()
}
