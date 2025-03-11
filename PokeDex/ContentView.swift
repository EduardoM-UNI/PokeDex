//
//  ContentView.swift
//  PokeDex
//
//  Created by Eduardo Monroy Husillos on 3/8/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = PokemonViewModel()
    @State private var pokemonToSearch = ""
    
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
                        
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                            PokemonCellView(pokemon: pokemon,viewModel: viewModel)
                        }
                    }
                }.padding(20)
            } //Scroll
            .searchable(text: $pokemonToSearch, prompt: "Search Pokemon")
            .onChange(of: pokemonToSearch, perform: { newValue in
                withAnimation {
                    viewModel.filterPokeom(name: newValue)
                }
            })
            .navigationBarTitle("Pokedex", displayMode:.inline)
        }
        
        
    }
}

#Preview {
    ContentView()
}


