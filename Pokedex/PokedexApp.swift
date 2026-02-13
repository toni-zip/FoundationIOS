//
//  PokedexApp.swift
//  Pokedex
//
//  Created by PokeGroup on 06/02/26.
//

import SwiftUI

@main
struct PokedexApp: App {
    @State private var store = PokedexStore()

    var body: some Scene {
        WindowGroup {
            DashboardNavigation()
                .environment(store)
        }
    }
}
