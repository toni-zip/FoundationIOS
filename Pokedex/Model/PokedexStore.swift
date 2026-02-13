//
//  PokedexStore.swift
//  Pokedex
//
//  Created by PokeGroup on 12/02/26.
//
import Observation
import Foundation

@Observable
final class PokedexStore {
    private let maxTeamSize = 6

    private var favoriteNames: [String] = []
    private var teamNames: [String] = []


    var favoritePokemons: [Pokemon] {
        favoriteNames.map { Pokemon(name: $0, url: "") }
    }

    var teamPokemons: [Pokemon] {
        teamNames.map { Pokemon(name: $0, url: "") }
    }

    func isFavorite(name: String) -> Bool {
        favoriteNames.contains(normalize(name))
    }

    func isInTeam(name: String) -> Bool {
        teamNames.contains(normalize(name))
    }

    var isTeamFull: Bool {
        teamNames.count >= maxTeamSize
    }

    func toggleFavorite(name: String) {
        let normalized = normalize(name)
        if let index = favoriteNames.firstIndex(of: normalized) {
            favoriteNames.remove(at: index)
        } else {
            favoriteNames.append(normalized)
        }
    }

    func toggleTeam(name: String) {
        let normalized = normalize(name)
        if let index = teamNames.firstIndex(of: normalized) {
            teamNames.remove(at: index)
        } else if teamNames.count < maxTeamSize {
            teamNames.append(normalized)
        }
    }

    private func normalize(_ name: String) -> String {
        name.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
    }
}
