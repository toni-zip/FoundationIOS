//
//  HomeView.swift
//  Pokedex
//
//  Created by Maria Laura Pereira on 06/02/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack{
                Color.red.ignoresSafeArea()
                
                VStack() {
                    Image("TopContent")
                        .resizable()
                        .frame(height:130)
                    VStack{
                        Text("YOUR DIGITAL")
                            .font(.largeTitle)
                            .padding(.top, 80)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        
                        Text("POKÉDEX")
                            .font(.largeTitle)
                            .foregroundColor(.yellow)
                            .fontWeight(.bold)
                        
                        NavigationLink {
                            PokemonListView()
                        } label: {
                            Rectangle()
                                .frame(width: 180, height: 60)
                                .foregroundColor(.white)
                                .cornerRadius(50)
                                .overlay(
                                    Text("Catch em All!")
                                        .foregroundColor(.black)
                                        .fontWeight(.semibold)
                                )
                        }
                    }
                    Spacer()
                    NavbarView()
                    
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    HomeView()
}
