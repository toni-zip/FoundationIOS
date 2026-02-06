//
//  NavbarView.swift
//  Pokedex
//
//  Created by Maria Laura Pereira on 06/02/26.
//

import SwiftUI
struct NavbarView: View {
    let color: Color
    
    var body: some View {
        NavigationStack {
            HStack(spacing: 40){
                
                NavigationLink("Home Page"){
                }
                NavigationLink("Pokemons"){
                }
                NavigationLink("Profile"){
                
                }
                
            }
            
        }
        .frame(height: 60)
        .background(color)
    }
}

#Preview {
    NavbarView(color: .red)
}
