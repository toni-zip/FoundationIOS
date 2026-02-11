//
//  BackgroundView.swift
//  Pokedex
//
//  Created by João Pedro Aveiro on 11/02/26.
//

import SwiftUI

struct BackgroundView<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        ZStack {
            Image("PokemonBackground")
                .resizable()
                .scaledToFill()
            content
        }
        .ignoresSafeArea()
    }
}

#Preview {
}
