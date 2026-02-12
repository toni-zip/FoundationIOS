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
    /*let abilities: [Abilities]
    let moves: [Move]*/

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

struct Abilities: Codable{
    let ability: Ability
    
}

struct Ability: Codable{
    let name: String
    
}
struct Move: Codable{
    let moves: Moves
    
}
struct Moves: Codable{
    let name: String
    
}
