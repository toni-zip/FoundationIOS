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
    var id: String { url.isEmpty ? name : url }
}

struct PokemonListResponse : Codable {
    let results: [Pokemon]
}
    
struct PokemonDetailsResponse : Codable{
    let sprites: Sprites
    let types: [TypeSlot]
    let id: Int
    let stats: [Stats]
    let weight: Int
    let height: Int
   
}


struct Stats: Codable {
    let baseStat, effort: Int
    let stat: Stat
}

struct Stat: Codable {
    let name: String
}

struct Sprites : Codable {
    let frontDefault: String
}

struct TypeSlot: Codable{
    let slot: Int
    let type: TypeDetail
}

struct TypeDetail: Codable{
    let name: String

}

