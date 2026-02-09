//
//  PokemonModel.swift
//  Pokedex
//
//  Created by Aluno Mack on 06/02/26.
//

import Foundation

struct Pokemon : Codable , Identifiable{
    let name: String
    let url: String
    var id: String {url}
}

struct PokemonListResponse : Codable {
    let results: [Pokemon]
}
    
struct PokemonDetailsResponse : Codable{
    let Sprites : Sprites
}


struct Sprites : Codable {
    let frontDefault: String
}
