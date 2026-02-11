import SwiftUI

struct PokemonCardView: View {
    let pokemon: Pokemon
    @State private var details: PokemonDetailsResponse?

    private var imageURL: URL? {
        if let details {
            return URL(string: details.sprites.frontDefault)
        }
        return nil
    }

    var body: some View {
        HStack(spacing: 16) {

            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.25))
                    .frame(width: 90, height: 90)

                AsyncImage(url: imageURL) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                } placeholder: {
                    ProgressView()
                }
            }

            
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 0) {
                    Text(pokemon.name.capitalized)
                        .font(.headline)
                    Text("#\(details?.id ?? 0)")
                        .fontWeight(.ultraLight)
                }

                if let types = details?.types {
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
                details = try await PokeAPI.getPokemonDetails(
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
