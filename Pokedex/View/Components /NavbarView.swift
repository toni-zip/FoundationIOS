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
                    MockView()
                }
                .foregroundStyle(Color(.black))
                NavigationLink("Pokemons"){
                }
                .foregroundStyle(Color(.black))
                NavigationLink("Profile"){
                }
                .foregroundStyle(Color(.black))
                
            }
            
        }
        .frame(height: 60)
        .background(color)
    }
}

#Preview {
    NavbarView(color: .red)
}
