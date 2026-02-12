//
//  HomeView.swift
//  Pokedex
//
//  Created by Maria Laura Pereira on 06/02/26.
//

import SwiftUI

struct HomeView: View {
    @Binding var isShowingWelcomeScreen: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("PokemonBackground")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack(spacing: 40) {
                    
                    Spacer()
                    
                    Image("pokedex_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 260)
                    
                    Button {
                        isShowingWelcomeScreen = false
                    } label: {
                        Text("Enter Pokédex")
                            .fontWeight(.semibold)
                            .frame(width: 220, height: 55)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(30)
                            .shadow(radius: 8)
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    HomeView(isShowingWelcomeScreen: .constant(true))
}
