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
                    .font(.system(size: 32))
                    .foregroundStyle(.secondary)
                    .frame(width: 70, height: 70)
            }
            
            Text(title)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
    }
}
