//
//  PokemonTypeColor.swift
//  Pokedex
//
//  Created by João Pedro Aveiro on 10/02/26.
//

import SwiftUI

extension Color {
    // Calcula automaticamente a cor ideal para o texto baseada no brilho da cor do fundo
    func adaptiveTextColor() -> Color {
        let uiColor = UIColor(self)
        var white: CGFloat = 0; // Brilho | Exemplo: 0.0 preto até 1.0 branco
        var alpha: CGFloat = 0; // Opacidade | Exemplo: 0.0 transparente até 1.0 opaco
        
        uiColor.getWhite(&white, alpha: &alpha) // Define o white e o alpha com base na UI atual
        
        return white > 0.5 ? .black : .white
    }
    
    static func pokemonType(type: String) -> Color {
        switch type {
        case "normal": return .gray
        case "fire": return .orange
        case "water": return .blue
        case "electric": return .yellow
        case "grass": return .green
        case "ice": return .mint
        case "fighting": return .red
        case "poison": return .purple
        case "ground": return .brown
        case "flying": return .teal
        case "psychic": return .pink
        case "bug": return .green
        case "rock": return .orange
        case "ghost": return .purple
        case "dragon": return .purple
        case "dark": return .black
        case "steel": return .gray
        case "fairy": return .pink
        default: return Color.secondary
        }
    }
}
