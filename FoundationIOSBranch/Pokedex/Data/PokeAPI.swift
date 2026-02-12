//
//  PokeAPI.swift
//  Pokedex
//
//  Created by PokeGroup on 06/02/26.
//

import Foundation

struct PokeAPI {
    static func getPokemonList() async throws -> [Pokemon] {
        let endpoint = "https://pokeapi.co/api/v2/pokemon?offset=0&limit=151"
        let url = URL(string: endpoint)
        
        guard let url else {
            throw PokeError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode
                == 200 else {
            throw PokeError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            return try decoder.decode(PokemonListResponse.self, from: data).results
        } catch {
            throw PokeError.invalidData
        }
        
    }
    static func getPokemonDetails(pokemonName: String) async throws -> PokemonDetailsResponse {
        let endpoint = "https://pokeapi.co/api/v2/pokemon/" + pokemonName
        let url = URL(string: endpoint)
        
        guard let url else {
            print(PokeError.invalidURL.localizedDescription)
            throw PokeError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode
                == 200 else {
            print(PokeError.invalidResponse.localizedDescription)
            throw PokeError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            return try decoder.decode(PokemonDetailsResponse.self, from: data)
        } catch {
            print(PokeError.invalidData.localizedDescription)
            throw PokeError.invalidData
        }    }
}


