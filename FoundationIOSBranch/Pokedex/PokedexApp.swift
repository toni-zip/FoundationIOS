//
//  PokedexApp.swift
//  Pokedex
//
//  Created by PokeGroup on 06/02/26.
//

import SwiftUI

@main
struct PokedexApp: App {
    @StateObject private var store = PokedexStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
