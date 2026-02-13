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
    @Environment(PokedexStore.self) private var store

    private var isFavorite: Bool { store.isFavorite(name: pokeName) }
    private var isInTeam: Bool { store.isInTeam(name: pokeName) }
    
    private var primaryTypeColor: Color {
        pokemonDetails?.types.first.map {
            Color.pokemonType(type: $0.type.name)
        } ?? .blue
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                heroHeader
                
                if let details = pokemonDetails {
                    VStack(spacing: 25) {
                        HStack {
                            ForEach(details.types, id: \.type.name) { typeSlot in
                                Text(typeSlot.type.name.uppercased())
                                    .font(.caption.bold())
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(Color.pokemonType(type: typeSlot.type.name))
                                    .clipShape(Capsule())
                                    .foregroundColor(.white)
                            }
                        }
                        
                        HStack(spacing: 40) {
                            verticalInfo(label: "ALTURA", value: String(format: "%.1f m", Double(details.height) / 10.0))
                            verticalInfo(label: "PESO", value: String(format: "%.1f kg", Double(details.weight) / 10.0))
                        }
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("STATUS BASE")
                                .font(.headline)
                                .padding(.leading)
                            
                            ForEach(details.stats, id: \.stat.name) { stat in
                                statRow(label: shortenStatName(stat.stat.name), value: stat.baseStat)
                            }
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground).opacity(0.5))
                        .cornerRadius(15)
                    }
                    .padding(.horizontal)
                }
            }
        }
        .background(primaryTypeColor.opacity(0.2).ignoresSafeArea())
        .task { await loadDetails() }
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
            }
        }
    }

        private func shortenStatName(_ name: String) -> String {
            switch name {
            case "special-attack": return "SP. ATK"
            case "special-defense": return "SP. DEF"
            case "hp": return "HP"
            default: return name.uppercased()
            }
        }
    
        private func verticalInfo(label: String, value: String) -> some View {
            VStack(spacing: 4) {
                Text(value).font(.title3.bold())
                Text(label).font(.caption).foregroundStyle(.secondary)
            }
        }

        private func statRow(label: String, value: Int) -> some View {
            HStack {
                Text(label.uppercased()).font(.caption.bold()).frame(width: 50, alignment: .leading)
                Text("\(value)").font(.caption).frame(width: 35)
                
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        Capsule().fill(.secondary.opacity(0.2))
                        Capsule()
                            .fill(primaryTypeColor)
                            .frame(width: geo.size.width * CGFloat(min(value, 150)) / 150.0)
                    }
                }
                .frame(height: 8)
            }
        }
    
    private var heroHeader: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 12) {
                Group {
                    if let details = pokemonDetails {
                        AsyncImage(url: URL(string: details.sprites.frontDefault)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 260, height: 260)
                                .glassOrb(primaryTypeColor)
                        } placeholder: {
                            shimmerOrb
                        }
                    } else {
                        shimmerOrb
                    }
                }
                .padding(.top, 90)
                
                HStack {
                    Text(pokeName.capitalized)
                        .font(.system(size: 34, weight: .heavy, design: .rounded))
                        .foregroundStyle(primaryTypeColor.adaptiveTextColor())
                        .shadow(color: .black.opacity(0.3), radius: 4)
                        .padding(.top, 20)
                    Text("#\(pokemonDetails?.id ?? 0)")
                        .font(.system(size: 34, weight: .heavy, design: .rounded))
                        .foregroundStyle(primaryTypeColor.adaptiveTextColor())
                        .shadow(color: .black.opacity(0.3), radius: 4)
                        .padding(.top, 20)
                }
                
                Spacer()
            }
        }
    }

    private var shimmerOrb: some View {
        Circle()
            .fill(.white.opacity(0.3))
            .frame(width: 240, height: 240)
            .overlay(
                ProgressView()
                    .scaleEffect(1.5)
                    .tint(.white)
            )
            .shimmer()
    }
    
    private func loadDetails() async {
        do {
            pokemonDetails = try await PokeAPI.getPokemonDetails(pokemonName: pokeName)
        } catch {
            print("Erro:", error.localizedDescription)
        }
    }
}

extension View {
    func glassOrb(_ color: Color) -> some View {
        self
            .background(.ultraThinMaterial)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(color.opacity(0.5), lineWidth: 4)
                    .blur(radius: 8)
            )
            .shadow(color: color.opacity(0.6), radius: 30)
            .shadow(color: .black.opacity(0.4), radius: 20)
    }
    
    // MARK: Cria brilho que passa sobre o círculo
    func shimmer() -> some View {
        self.overlay(
            LinearGradient(
                colors: [.clear, .white.opacity(0.6), .clear],
                startPoint: .leading,
                endPoint: .trailing
            )
            .offset(x: 100)
            .animation(.linear(duration: 1.5).repeatForever(autoreverses: false), value: UUID())
        )
    }
}

#Preview {
    PokemonDetailsView(pokeName: "charmander")
        .environment(PokedexStore())
}
