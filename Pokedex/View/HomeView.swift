//
//  HomeView.swift
//  Pokedex
//
//  Created by Maria Laura Pereira on 06/02/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
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
                        .multilineTextAlignment(.leading)
                    
                    Text("POKEDEX")
                        .font(.largeTitle)
                        .foregroundColor(.yellow)
                        .multilineTextAlignment(.leading)
                    
    
                }
                Spacer()
                NavbarView(color: .red)
                
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    HomeView()
}
