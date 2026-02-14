//
//  PokemonMiniCardEmpty.swift
//  Pokedex
//
//  Created by João Pedro Aveiro on 13/02/26.
//
import SwiftUI

struct PokemonMiniCardEmpty: View {
    let title: String
    
    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemGray6))
                    .frame(height: 100)
                Image(systemName: "plus")
                    .foregroundColor(.black)
            }
            Text(title)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    PokemonMiniCardEmpty(title: "Add a pokemon")
}
