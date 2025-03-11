//
//  ContentView.swift
//  PokeDex
//
//  Created by Eduardo Monroy Husillos on 3/8/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = PokemonViewModel()
    
    private let numberOfColumns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVGrid(columns: numberOfColumns){
                    ForEach(viewModel.filteredPokemon, id: \.self) { pokemon in
                        PokemonCellView(pokemon: pokemon,viewModel: viewModel)
                    }
                }.padding(20)
            }
            .navigationBarTitle("Pokedex", displayMode:.inline)
        }
        
        
    }
}

#Preview {
    ContentView()
}


