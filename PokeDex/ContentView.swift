//
//  ContentView.swift
//  PokeDex
//
//  Created by Eduardo Monroy Husillos on 3/8/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = PokemonViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.listPokemon, id: \.id) { pokemon in
                
                Text(pokemon.name)
                
            }
        }
        
    }
}

#Preview {
    ContentView()
}
